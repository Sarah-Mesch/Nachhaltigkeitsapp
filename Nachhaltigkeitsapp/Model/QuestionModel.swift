
import Foundation

enum QuestionType {
    case multipleChoice
    case trueFalse
    case slider
    case textInput
    case imageChoice
}

struct Question: Identifiable {
    let id: Int
    let title: String
    let type: QuestionType
    let options: [String]?
    let correctAnswer: Any?
    let points: Int?
    let imageName: String?
    let answerPoints: [String: Int]?
    let sliderMin: Int?
    let sliderMax: Int?
    let sliderStep: Int?
    let sliderScoreRanges: [(range: ClosedRange<Int>, points: Int)]?
    
    init(
            id: Int,
            title: String,
            type: QuestionType,
            options: [String]? = nil,
            correctAnswer: Any? = nil,
            points: Int? = nil,
            imageName: String? = nil,
            answerPoints: [String: Int]? = nil,
            sliderMin: Int? = nil,
            sliderMax: Int? = nil,
            sliderStep: Int? = nil,
            sliderScoreRanges: [(range: ClosedRange<Int>, points: Int)]? = nil
        ) {
            self.id = id
            self.title = title
            self.type = type
            self.options = options
            self.correctAnswer = correctAnswer
            self.points = points
            self.imageName = imageName
            self.answerPoints = answerPoints
            self.sliderMin = sliderMin
            self.sliderMax = sliderMax
            self.sliderStep = sliderStep
            self.sliderScoreRanges = sliderScoreRanges
        }
    
}
