//
//  Movie.swift
//  TMDBJson
//
//  Created by Sean Calkins on 2/11/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Movie {
    var poster_path: String
    var adult: Bool
    var overview: String
    var release_date: String
    var genre_ids: [Int]
    var id: Int
    var original_language : String
    var title: String
    var backdrop_path : String
    var popularity: Double
    var vote_count: Int
    var video: Bool
    var vote_average: Double
    
    init(dict: JSONDictionary) {
        
        self.poster_path = ""
        self.adult = false
        self.overview = ""
        self.release_date = ""
        self.genre_ids = []
        self.id = 1
        self.original_language = ""
        self.title = ""
        self.backdrop_path = ""
        self.popularity = 1.0
        self.vote_count = 0
        self.video = false
        self.vote_average = 0.0
        
        if let poster_path = dict["poster_path"] as? String {
            self.poster_path = poster_path
            print(poster_path)
        } else {
            print("no bueno on poster path")
        }
        if  let adult = dict["adult"] as? Bool {
            self.adult = adult
            print(adult)
        } else {
            print("no bueno on adult senor")
        }
        if let overview = dict["overview"] as? String {
            self.overview = overview
            print(overview)
        } else {
            print("your overview is heckin on you")
        }
        if let release_date = dict["release_date"] as? String {
            self.release_date = release_date
            print(release_date)
        } else {
            print("release_date effed up")
        }
        if let genre_ids = dict["genre_ids"] as? [Int] {
            self.genre_ids = genre_ids
            print(genre_ids)
        } else {
            print("no dice on the genre_ids")
        }
        if let id = dict["id"] as? Int {
            self.id = id
            print(id)
        } else {
            print("fix ur id bruh")
        }
        if let original_language = dict["original_language"] as? String {
            self.original_language = original_language
            print(original_language)
        } else {
            print("no habla original_language")
        }
        if let title = dict["title"] as? String {
            self.title = title
            print(title)
        } else {
            print("check your title before you wreck your title")
        }
        if let backdrop_path = dict["backdrop_path"] as? String {
            self.backdrop_path = backdrop_path
            print(backdrop_path)
        } else {
            print("the backdrop_path has dropped off the back")
        }
        if let popularity = dict["popularity"] as? Double {
            self.popularity = popularity
            print(popularity)
        } else {
            print("you are not popular")
        }
        if let vote_count = dict["vote_count"] as? Int {
            self.vote_count = vote_count
            print(vote_count)
        } else {
            print("your vote didn't count")
        }
        if let video = dict["video"] as? Bool {
            self.video = video
            print(video)
        } else {
            print("there is problem with video")
        }
        if let vote_average = dict["vote_average"] as? Double {
            self.vote_average = vote_average
            print(vote_average)
        } else {
            print("your vote_average sucks")
        }
        
    }
}