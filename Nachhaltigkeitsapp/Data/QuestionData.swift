import Foundation

struct QuestionData {
    static let questions: [Question] = [
                // 1
                Question(
                    id: 1,
                    title: "Wie oft nutzt du in einer Woche das Auto?",
                    type: .slider,
                    imageName: "Auto",
                    sliderMin: 0,
                    sliderMax: 100,
                    sliderStep: 1,
                    sliderScoreRanges: [
                           (0...5, 5),
                           (6...15, 3),
                           (16...20, 2),
                           (21...30, 1),
                           (31...100, 0)
                    ]
                ),

                // 2
                Question(
                    id: 2,
                    title: "Wäschetrockner verbrauchen mehr Strom als Waschmaschinen.",
                    type: .trueFalse,
                    options: ["Wahr", "Falsch"],
                    correctAnswer: true,
                    points: 2,
                    imageName: "Haushalt",
                ),

                // 3
                Question(
                    id: 3,
                    title: "Wie trocknest du deine Wäsche in der Regel?",
                    type: .multipleChoice,
                    options: ["Mit dem Wäschetrockner", "Auf dem Wäscheständer", "Beides je nach Wetter", "Ich bringe sie in die Reinigung"],
                    imageName: "Wäsche",
                    answerPoints: [
                            "Auf dem Wäscheständer": 5,
                            "Beides je nach Wetter": 3,
                            "Mit dem Wäschetrockner": 2,
                            "Ich bringe sie in die Reinigung": 1
                        ]
                ),

                // 4
                Question(
                    id: 4,
                    title: "Würdest du kaputte Dinge erst versuchen zu reparieren, bevor du sie ersetzt?",
                    type: .textInput,
                    correctAnswer: "Ja",
                    points: 2,
                    imageName: "Reparatur"
                ),

                // 5
                Question(
                    id: 5,
                    title: "Welches Verkehrsmittel verwendest du im Urlaub um von A nach B zu kommen?",
                    type: .imageChoice,
                    options: ["Zug", "Auto", "Tram", "Fernbus"],
                    imageName: "Urlaub",
                    answerPoints: [
                            "Zug": 5,
                            "Tram": 3,
                            "Fernbus": 2,
                            "Auto": 1
                        ]
                ),

                // 6
                Question(
                    id: 6,
                    title: "Wie oft pro Woche isst du Fleisch?",
                    type: .slider,
                    imageName: "Fleisch",
                    sliderMin: 0,
                    sliderMax: 100,
                    sliderStep: 1,
                    sliderScoreRanges: [
                           (0...5, 5),
                           (6...10, 3),
                           (11...20, 2),
                           (21...30, 1),
                           (31...100, 0)
                       ]
                ),

                // 7
                Question(
                    id: 7,
                    title: "Wie kaufst du Obst und Gemüse meistens ein?",
                    type: .multipleChoice,
                    options: ["In Plastik verpackt", "Lose auf dem Markt oder im Supermarkt", "Mit Papier-Verpackung", "Nur Tiefkühlware"],
                    imageName: "Obst",
                    answerPoints: [
                            "Lose auf dem Markt oder im Supermarkt": 5,
                            "Mit Papier-Verpackung": 3,
                            "In Plastik verpackt": 2,
                            "Nur Tiefkühlware": 1
                        ]
                ),

                // 8
                Question(
                    id: 8,
                    title: "Ökostrom ist teurer als normaler Strom.",
                    type: .trueFalse,
                    options: ["Wahr", "Falsch"],
                    correctAnswer: false,
                    points: 2,
                    imageName: "Ökostrom"
                ),

                // 9
                Question(
                    id: 9,
                    title: "Welche Raumtemperatur gilt als klimafreundlich?",
                    type: .textInput,
                    correctAnswer: "20",
                    points: 2,
                    imageName: "Heizung"
                ),

                // 10
                Question(
                    id: 10,
                    title: "Welche dieser Verpackungen ist besonders umweltschonend?",
                    type: .imageChoice,
                    options: ["Glasflasche", "Tetrapack", "Plastik", "Aluschale"],
                    imageName: "Wald",
                    answerPoints: [
                            "Glasflasche": 5,
                            "Tetrapack": 3,
                            "Aluschale": 2,
                            "Plastik": 1
                        ]
                ),

                // 11
                Question(
                    id: 11,
                    title: "Wie oft kaufst du Produkte gebraucht oder Second-Hand im Jahr?",
                    type: .slider,
                    imageName: "Secondhand",
                    sliderMin: 0,
                    sliderMax: 200,
                    sliderStep: 1,
                    sliderScoreRanges: [
                           (0...10, 1),
                           (11...20, 2),
                           (21...30, 3),
                           (31...200, 5)
                       ]
                ),

                // 12
                Question(
                    id: 12,
                    title: "Wie oft wirfst du Lebensmittel weg?",
                    type: .multipleChoice,
                    options: ["täglich", "mehrmals pro Woche", "Ab und an", "So gut wie nie"],
                    imageName: "Mülltonne",
                    answerPoints: [
                            "So gut wie nie": 5,
                            "Ab und an": 3,
                            "mehrmals pro Woche": 2,
                            "täglich": 1
                        ]
                ),

                // 13
                Question(
                    id: 13,
                    title: "Mit dem Fahrrad spart man im Vergleich zum Auto jährlich mehrere Hundert Kilogramm CO₂ ein.",
                    type: .trueFalse,
                    options: ["Wahr", "Falsch"],
                    correctAnswer: true,
                    points: 2,
                    imageName: "Fahrrad"
                ),

                // 14
                Question(
                    id: 14,
                    title: "Wie verhindert man Stromverschwendung bei Netzteilen und Ladegeräten?",
                    type: .textInput,
                    correctAnswer: "Ausstecken",
                    points: 2,
                    imageName: "Ladekabel"
                ),

                // 15
                Question(
                    id: 15,
                    title: "Welches dieser Lebensmittel benötigt am wenigsten Energie für Transport und Kühlung?",
                    type: .imageChoice,
                    options: ["Apfel", "Banane", "Kiwi", "Traube"],
                    imageName: "Obst",
                    answerPoints: [
                            "Apfel": 5,
                            "Traube": 3,
                            "Banane": 2,
                            "Kiwi": 1
                        ]
                ),

                // 16
                Question(
                    id: 16,
                    title: "Wie oft kaufst du neue Kleidung im Monat?",
                    type: .slider,
                    imageName: "Kleidung",
                    sliderMin: 0,
                    sliderMax: 100,
                    sliderStep: 1,
                    sliderScoreRanges: [
                           (0...0, 5),
                           (1...3, 3),
                           (4...20, 2),
                           (21...30, 1),
                           (31...100, 0)
                       ]
                ),

                // 17
                Question(
                    id: 17,
                    title: "Was ist die nachhaltigste Wahl für eine Urlaubsreise?",
                    type: .multipleChoice,
                    options: ["Zug", "Auto", "Flugzeug", "Bus"],
                    imageName: "Flugzeug",
                    answerPoints: [
                            "Zug": 5,
                            "Bus": 3,
                            "Auto": 2,
                            "Flugzeug": 1
                        ]
                ),

                // 18
                Question(
                    id: 18,
                    title: "Tiefgekühlte Lebensmittel verbrauchen in der Herstellung und Lagerung mehr Energie als frische Produkte.",
                    type: .trueFalse,
                    options: ["Wahr", "Falsch"],
                    correctAnswer: true,
                    points: 2,
                    imageName: "Lebensmittel"
                ),

                // 19
                Question(
                    id: 19,
                    title: "Welche Verpackung verwendest du fürs Einkaufen?",
                    type: .imageChoice,
                    options: ["Wiederverwendbare Tasche", "Plastiktüte", "Papiertüte", "Styroporbox"],
                    imageName: "Plastik",
                    answerPoints: [
                            "Wiederverwendbare Tasche": 5,
                            "Papiertüte": 3,
                            "Styroporbox": 0,
                            "Plastiktüte": 0
                        ]
                ),

                // 20
                Question(
                    id: 20,
                    title: "Wie viele Minuten brauchst du durchschnittlich zum duschen?",
                    type: .textInput,
                    correctAnswer: "5",
                    points: 2,
                    imageName: "Dusche"
                )
    ]
}
