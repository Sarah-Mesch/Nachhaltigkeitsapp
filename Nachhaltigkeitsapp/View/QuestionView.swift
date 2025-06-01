import SwiftUI

struct QuestionView: View {
    @ObservedObject var quizManager = QuizManager.shared
    @Binding var path: NavigationPath
    @State private var sliderValue: Double = 0
    @State private var textInput: String = ""
    @State private var matchOrder: [String] = []

    var body: some View {
        ScrollView {
        VStack(spacing: 20) {
            Text("Frage \(quizManager.currentQuestionIndex + 1) von \(quizManager.totalQuestions)")
                .font(.headline)

            ProgressView(value: Double(quizManager.currentQuestionIndex + 1),
                         total: Double(quizManager.totalQuestions))
                .accentColor(Color("Hellgrün"))
                .padding(.horizontal)

            if let imageName = quizManager.currentQuestion.imageName {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding(.bottom)
            }

            Text(quizManager.currentQuestion.title)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()


            switch quizManager.currentQuestion.type {
            case .trueFalse:
                if let options = quizManager.currentQuestion.options {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            handleAnswer(option == "Wahr")
                        }) {
                            Text(option)
                                .padding()
                                .frame(width: 200)
                                .background(Color("Hellgrün"))
                                .foregroundColor(Color("Schriftfarbe"))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }

            case .multipleChoice:
                if let options = quizManager.currentQuestion.options {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            handleAnswer([option])
                        }) {
                            Text(option)
                                .padding()
                                .frame(width: 200)
                                .background(Color("Hellgrün"))
                                .foregroundColor(Color("Schriftfarbe"))
                                .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }

            case .slider:
                VStack {
                    let min = Double(quizManager.currentQuestion.sliderMin ?? 0)
                    let max = Double(quizManager.currentQuestion.sliderMax ?? 20000)
                    let step = Double(quizManager.currentQuestion.sliderStep ?? 100)
                   
                    Slider(value: $sliderValue, in: min...max, step: step)
                        .padding()
                        .frame(width: 400)

                    Text("\(Int(sliderValue))")
                        .font(.headline)
                        .padding()

                    Button("Antwort bestätigen") {
                        handleAnswer(Int(sliderValue))
                        sliderValue = 0
                    }
                    .padding()
                    .background(Color("Hellgrün"))
                    .foregroundColor(Color("Schriftfarbe"))
                    .cornerRadius(10)
                    .buttonStyle(PlainButtonStyle())
                }

            case .textInput:
                VStack {
                    TextField("Deine Antwort...", text: $textInput)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .frame(width: 400)

                    Button("Antwort bestätigen") {
                        handleAnswer(textInput)
                        textInput = ""
                    }
                    .padding()
                    .background(Color("Hellgrün"))
                    .foregroundColor(Color("Schriftfarbe"))
                    .cornerRadius(10)
                    .buttonStyle(PlainButtonStyle())
                }

            case .imageChoice:
                if let options = quizManager.currentQuestion.options {
                    let columns = [
                        GridItem(.adaptive(minimum: 150), spacing: 8),
                        GridItem(.adaptive(minimum: 150), spacing: 8)
                    ]

                    LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            handleAnswer(option)
                        }) {
                            VStack {
                                Image(option)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 100)
                                    .padding(.horizontal, 8)
                                
                                Text(option)
                                    .padding(.top, 5)
                            }
                            .padding(.horizontal, 8)
                            .frame(width: 150, height: 200)
                            .background(Color("Hellgrün"))
                            .foregroundColor(Color("Schriftfarbe"))
                            .cornerRadius(10)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                    
                }
            
            }

            Spacer()
            
            HStack {
                Button(action: {
                    quizManager.goToPreviousQuestion()
                }) {
                    Label("Zurück", systemImage: "chevron.left")
                }
                .disabled(!quizManager.canGoBack)

                Spacer()

                Button(action: {
                    quizManager.goToNextQuestion(path: $path)
                }) {
                    Label("Weiter", systemImage: "chevron.right")
                }
            }
            .padding()
            .background(Color("Grün").opacity(0.2))
            .cornerRadius(8)
        }
        .padding()
        .background(Color("Dunkelgrün"))
    }
  
    }
    
    func handleAnswer(_ answer: Any) {
        let isLast = quizManager.currentQuestionIndex >= quizManager.totalQuestions - 1
        quizManager.submitAnswer(answer)

        if isLast {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                path.append("result")
            }
        }
        
    }
}

