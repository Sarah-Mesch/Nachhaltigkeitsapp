
import SwiftUI

struct ContentView: View {
    @State private var isEnglish = false
    @State private var path = NavigationPath()
    @StateObject private var quizManager = QuizManager.shared

    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
            VStack(spacing: 30) {
                Text(isEnglish ? "sustainability self test" : "Nachhaltigkeits-Selbsttest")
                    .font(.headline)
                    .padding(.top)
                    .foregroundColor(Color("Beige"))

                Image(systemName: "leaf.circle.fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundColor(Color("Hellgrün"))

                Text(isEnglish ? "Find out your sustainability level" : "Finde deine Nachhaltigkeitsstufe heraus")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Beige"))
                    .padding(.horizontal)

                Text(isEnglish
                     ? "Answer 20 questions about recycling, energy, food, fashion and animal welfare to discover how eco-friendly your lifestyle is."
                     : "Beantworte 20 Fragen zu Recycling, Energie, Ernährung, Konsum und Tierwohl, um herauszufinden, wie nachhaltig dein Lebensstil ist.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal)

                Button(action: {
                    isEnglish.toggle()
                }) {
                    Text(isEnglish ? "Zurück zu Deutsch" : "Switch to English")
                        .font(.footnote)
                        .foregroundColor(Color("Beige"))
                }

                Button(action: {
                    path.append("quiz")
                }) {
                    Text(isEnglish ? "Let's Go" : "Los geht's")
                        .font(.headline)
                        .padding()
                        .frame(width: 200)
                        .background(Color("Hellgrün"))
                        .foregroundColor(Color("Schriftfarbe"))
                        .cornerRadius(12)
                        .shadow(radius: 4)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal, 40)

                Spacer()
            }
            .padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [Color("Grün"), Color("Dunkelgrün")]),
                               startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
            )
            .navigationDestination(for: String.self) {
                value in
                if value == "quiz" {
                    QuestionView(quizManager: quizManager, path: $path)
                } else if value == "result" {
                    ResultView(quizManager: quizManager, path: $path)
                }
            }
            }
        }
    }
}


#Preview {
    ContentView()
}


