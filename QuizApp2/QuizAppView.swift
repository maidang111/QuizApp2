//
//  ViewController.swift
//  QuizApp2
//
//  Created by Mai Dang on 3/7/23.
//

import UIKit

class QuizAppView: UIViewController {
    private var question_arr : Array<Data> = []
    private var count : Int = 0
    private var dataFetched : Bool = false

    @IBOutlet var questionLabel : UILabel!
    @IBAction func skipButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(from: url)
        if dataFetched {
            print(question_arr.count)
        }
    }
    private func getData (from url: String){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            guard let data = data, error == nil else{
                print("something went wrong")
                return
            }
            
            var result : [Data]?
            do {
                result = try JSONDecoder().decode([Data].self, from:data)
            } catch {
                print("\(error)")
            }
            
            guard let json = result else{
                return
            }
            
            for i in json{
                self.question_arr.append(i)
            }
            self.dataFetched = true
        }).resume()
    }
        
    private func printData() {
        for i in 0 ... 9{
            print(question_arr[i].question)
        }
    }
    
}
//[QuizApp2.Data(category: "Science", id: "6244378e746187c5e7be935e", correctAnswer: "Sodium hydroxide", incorrectAnswers: ["Sodium tetraborate decahydrate", "Silicon dioxide", "Deuterium oxide"], question: "What chemical has the formula NaOH?", tags: ["chemistry", "science"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false),
// QuizApp2.Data(category: "Music", id: "622a1c357cc59eab6f94fefd", correctAnswer: "Kylie Minogue", incorrectAnswers: ["Madonna", "Mika", "Hikaru Utada"], question: "Which musician released the studio album \'Light Years\'?", tags: ["music_albums", "musicians", "music"], type: "Multiple Choice", difficulty: "hard", regions: [], isNiche: false),
// QuizApp2.Data(category: "Film & TV", id: "622a1c377cc59eab6f950719", correctAnswer: "Kathy Bates", incorrectAnswers: ["Maggie Smith", "Helen Mirren", "Kate Winslet"], question: "Which actress has played roles in both American Horror Story and Titanic?", tags: ["acting", "film_and_tv"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false),
// QuizApp2.Data(category: "Science", id: "622a1c3f7cc59eab6f952377", correctAnswer: "Feathers", incorrectAnswers: ["Wings", "Eggs", "Beaks"], question: "What makes an animal a bird?", tags: ["science"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false),
// QuizApp2.Data(category: "Music", id: "622a1c357cc59eab6f94ff63", correctAnswer: "The Cardigans", incorrectAnswers: ["Coldplay", "Ace of Base", "Westlife"], question: "Whose 1996 Debut Album Was Entitled \"First Band On The Moon\"", tags: ["music_albums", "1990\'s", "music"], type: "Multiple Choice", difficulty: "hard", regions: [], isNiche: false), QuizApp2.Data(category: "Sport & Leisure", id: "622a1c347cc59eab6f94f8a6", correctAnswer: "Motor Racing", incorrectAnswers: ["Track and field", "Rowing", "Baseball"], question: "With which sport is Aryton Senna associated?", tags: ["people", "sport"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false), QuizApp2.Data(category: "Science", id: "6242cb94d543524f1b19c93c", correctAnswer: "A flock", incorrectAnswers: ["A cast", "A plump", "A kindle"], question: "What is the word for a group of sheep?", tags: ["science"], type: "Multiple Choice", difficulty: "hard", regions: [], isNiche: false),
// QuizApp2.Data(category: "Geography", id: "625e9ed0796f721e95543f6e", correctAnswer: "Red", incorrectAnswers: ["Orange", "Black", "Maroon"], question: "Which of these colors would you find on the flag of Iran?", tags: ["flags", "geography"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false), QuizApp2.Data(category: "Geography", id: "62374161cb85f7ce9e949d60", correctAnswer: "Port Louis", incorrectAnswers: ["Vilnius", "Castries", "Pristina"], question: "What is the capital city of Mauritius?", tags: ["geography"], type: "Multiple Choice", difficulty: "hard", regions: [], isNiche: false),
// QuizApp2.Data(category: "Film & TV", id: "622a1c367cc59eab6f950305", correctAnswer: "Texas Chainsaw Massacre", incorrectAnswers: ["Halloween", "Nightmare on Elm Street", "The Blair Witch Project"], question: "With Which Horror Film Would You Associate The Character Of Leatherface", tags: ["film_and_tv"], type: "Multiple Choice", difficulty: "medium", regions: [], isNiche: false)]

