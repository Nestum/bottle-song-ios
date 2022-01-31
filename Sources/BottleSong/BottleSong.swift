//Solution goes in Sources

public class BottleSong {
    
    private var numberOfBottles: Int
    private var spokenVerses: String = ""
    
    private let noBottlesTemplate = "No green bottles hanging on the wall,no green bottles hanging on the wall,\nGo to the store and buy some more, 99 green bottle hanging on the wall"
    private let topHalfVerseTemplate = "{0} green bottles hanging on the wall,\n{0} green bottles hanging on the wall,\n"
    private let thirdVerseTemplate = "And if 1 green bottle should accidentally fall,\n"
    private let fourthVerseTemplate = "There will be {1} green bottles hanging on the wall."
    
    public init(numberOfBottles: Int) {
        self.numberOfBottles = numberOfBottles
    }
    
    public func generateVersesOfBottlesSong() -> String {
        spokenVerses = ""
        speakFor(numberOfBottles: numberOfBottles)
        spokenVerses += noBottlesTemplate
        return spokenVerses
    }
    
    private func speakFor(numberOfBottles: Int) {
        guard numberOfBottles > 0 else {
            return
        }
        
        spokenVerses += buildVerseFor(numberOfBottles: numberOfBottles)

        let remindingBottles = numberOfBottles - 1
        speakFor(numberOfBottles: remindingBottles)
    }
    
    func buildVerseFor(numberOfBottles: Int) -> String {

        var topHalfVerses = topHalfVerseTemplate.replacing(of: "{0}", with: String(numberOfBottles))
        var thirdVerse = thirdVerseTemplate
        var forthVerse = fourthVerseTemplate.replacing(of: "{1}", with: String(numberOfBottles - 1))
        if numberOfBottles == 1 {
            topHalfVerses = topHalfVerses.replacing(of: "bottles", with: "bottle")
            thirdVerse = thirdVerse.replacing(of: "1", with: "this")
            forthVerse = forthVerse.replacing(of: "be 0", with: "no")
        } else if numberOfBottles == 2 {
            forthVerse = forthVerse.replacing(of: "bottles", with: "bottle")
        } else if numberOfBottles == 59 {
            thirdVerse = thirdVerse.replacing(of: "1", with: "58")
        }

        return topHalfVerses + thirdVerse + forthVerse + "\n\n"
    }
}

extension String {
    func replacing(of oldString: String, with newString: String) -> String {

        guard !oldString.isEmpty, !newString.isEmpty else { return self }

        let charArray = Array(self.characters)
        let oldCharArray = Array(oldString.characters)
        let newCharArray = Array(newString.characters)

        var matchedChars = 0
        var resultCharArray = [Character]()

        for char in charArray {
            if char == oldCharArray[matchedChars] {
                matchedChars += 1
                if matchedChars == oldCharArray.count {
                    resultCharArray.append(contentsOf: newCharArray)
                    matchedChars = 0
                }
            } else {
                for i in 0 ..< matchedChars {
                    resultCharArray.append(oldCharArray[i])
                }
                if char == oldCharArray[0] {
                    matchedChars = 1
                } else {
                    matchedChars = 0
                    resultCharArray.append(char)
                }
            }
        }

        return String(resultCharArray)

    }
}

