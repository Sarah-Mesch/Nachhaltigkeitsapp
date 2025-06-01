import Foundation
import SwiftUI

class QuizManager: ObservableObject {
    static let shared = QuizManager()

    @Published var currentQuestionIndex = 0
    @Published var score = 0
    @Published var answers: [Int: Any] = [:]
    @Published var questions: [Question] = []

    var totalQuestions: Int {
        QuestionData.questions.count
    }

    var currentQuestion: Question {
        QuestionData.questions[currentQuestionIndex]
    }
    
    func submitAnswer(_ answer: Any) {
        let question = currentQuestion
        let questionId = question.id

        // Alte Punkte abziehen, wenn vorhanden
        if let previousAnswer = answers[questionId] {
            let previousPoints = calculatePoints(for: question, answer: previousAnswer)
            score -= previousPoints
        }

        // Antwort speichern
        answers[questionId] = answer

        // Neue Punkte berechnen und hinzufügen
        let newPoints = calculatePoints(for: question, answer: answer)
        score += newPoints

        // Weiter zur nächsten Frage
        if currentQuestionIndex < totalQuestions - 1 {
            currentQuestionIndex += 1
        }
    }

    func reset() {
        currentQuestionIndex = 0
        score = 0
        answers = [:]
    }

    private init() {}
    
    var canGoBack: Bool {
        currentQuestionIndex > 0
    }

    var canGoForward: Bool {
        currentQuestionIndex < questions.count - 1
    }

    func goToPreviousQuestion() {
        if canGoBack {
            currentQuestionIndex -= 1
        }
    }
    
    func goToNextQuestion(path: Binding<NavigationPath>) {
        let question = currentQuestion
        let questionId = question.id

        // Falls schon Antwort → Punkte aktualisieren
        if let existingAnswer = answers[questionId] {
            submitAnswer(existingAnswer)
        }

        if currentQuestionIndex < totalQuestions - 1 {
            currentQuestionIndex += 1
        } else {
            path.wrappedValue.append("result")
        }
    }

    func calculatePoints(for question: Question, answer: Any) -> Int {
        switch question.type {
            
        case .trueFalse:
               if let correct = question.correctAnswer as? Bool,
                  let userAnswer = answer as? Bool,
                  userAnswer == correct {
                   return question.points ?? 0
               } else {
                   return 0
               }
               
           case .textInput:
               if let correct = question.correctAnswer as? String,
                  let userAnswer = answer as? String,
                  userAnswer.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() ==
                  correct.trimmingCharacters(in: .whitespacesAndNewlines).lowercased() {
                   return question.points ?? 0
               } else {
                   return 0
               }
            
        case .multipleChoice, .imageChoice:
            if let answerStr = answer as? String,
               let answerPoints = question.answerPoints {
                return answerPoints[answerStr] ?? 0
            }

        case .slider:
            if let intValue = answer as? Int,
               let scoreRanges = question.sliderScoreRanges {
                for (range, points) in scoreRanges {
                    if range.contains(intValue) {
                        return points
                    }
                }
                return 0
            }
        }

        return 0
    }


}
