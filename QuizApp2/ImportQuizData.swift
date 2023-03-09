//
//  ImportQuizData.swift
//  QuizApp2
//
//  Created by Mai Dang on 3/7/23.
//
import Foundation
let url = "https://the-trivia-api.com/api/questions/"
struct QuizAPIData : Codable {
    let data: Data
}
struct Data: Codable {
    let category: String
    let id: String
    let correctAnswer: String
    let incorrectAnswers: Array<String>
    let question: String
    let tags: Array<String>
    let type: String
    let difficulty: String
    let regions: Array<String>
    let isNiche: Bool
}

let url2 = "https://api.sunrise-sunset.org/json?date=2020-01-01&lat=-74.0060&lng=40.7128&formatted=0"
struct Response: Codable {
    let results: MyResult
    let status: String
}

struct MyResult: Codable {
    let sunrise: String
    let sunset: String
    let solar_noon: String
    let day_length: Int
    let civil_twilight_begin: String
    let civil_twilight_end: String
    let nautical_twilight_begin: String
    let nautical_twilight_end: String
    let astronomical_twilight_begin: String
    let astronomical_twilight_end: String
}
//{
//     "category":"Music",
//     "id":"622a1c357cc59eab6f94fd9d",
//     "correctAnswer":"Smile",
//     "incorrectAnswers":[
//        "Grin",
//        "Laugh",
//        "Cry"
//     ],
//     "question":"Which legendary Beach boys album was never completed?",
//     "tags":[
//        "music_albums",
//        "music"
//     ],
//     "type":"Multiple Choice",
//     "difficulty":"hard",
//     "regions":[
//
//     ],
//     "isNiche":false
//  },
