import SwiftUI

struct ResultView: View {
    @ObservedObject var quizManager: QuizManager
    @Binding var path: NavigationPath

    var body: some View {
        ZStack {
            Color("Dunkelgrün")
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("Ergebnis")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color("Hellgrün"))
                    .padding()
                   
                    

                Text("Glückwunsch! Du hast \(quizManager.score) Punkte erreicht.")
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
                    

                Text("Deine Nachhaltigkeitsstufe: \(calculateLevel(score: quizManager.score))")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding()
                   

                Text(tipText(for: quizManager.score))
                    .font(.body)
                    .foregroundColor(Color("Hellgrün"))
                    .padding()
                   

                Button("Nochmal starten") {
                    quizManager.reset()
                    path = NavigationPath()
                }
                .padding()
                .background(Color("Hellgrün"))
                .foregroundColor(.black)
                .cornerRadius(10)
                .buttonStyle(PlainButtonStyle())
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
    
    }

    func calculateLevel(score: Int) -> String {
        switch score {
        case 0..<5: return "Stufe 5 - Starter"
        case 5..<10: return "Stufe 4 - Lernend"
        case 10..<15: return "Stufe 3 - Umweltbewusst"
        case 15..<20: return "Stufe 2 - Vorbild"
        case 20..<83: return "Stufe 1 - Nachhaltigkeitsexperte"
        default: return "Stufe 5 - Starter"
        }
    }

    func tipText(for score: Int) -> String {
        switch score {
        case 0..<5:
            return "Tipp: Starte klein – nimm Stoffbeutel statt Plastiktüten und trenne deinen Müll richtig. Probiere mal Hafermilch im Kaffee aus."
        case 5..<10:
            return "Tipp: Achte auf kurze Duschzeiten, schalte Geräte ganz aus statt auf Standby und kaufe saisonale Lebensmittel."
        case 10..<15:
            return "Tipp: Versuche öfter das Rad oder den Bus zu nutzen und achte beim Einkauf auf Verpackungen. Vermeide Einwegplastik."
        case 15..<20:
            return "Tipp: Reduziere deinen Fleischkonsum und probiere Reparaturen statt Neukäufe."
        case 20..<83:
            return "Tipp: Du bist schon richtig gut! Setze dir ein neues Ziel – z. B. eine Woche autofrei oder plastikfrei leben."
        default: return "Tipp: Starte klein – nimm Stoffbeutel statt Plastiktüten und trenne deinen Müll richtig. Probiere mal Hafermilch im Kaffee aus."
        }
    }
}

#Preview {
    ResultView(quizManager: QuizManager.shared,  path: .constant(NavigationPath()))
}
