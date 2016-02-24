//
//  Friend.swift
//  Github Friends
//
//  Created by Sean Calkins on 2/23/16.
//  Copyright © 2016 Sean Calkins. All rights reserved.
//

import Foundation

class Friend {
    
    var login: String = ""
    var id: Int = 0
    var avatar_url: String = ""
    var gravatar_id: String = ""
    var url: String = ""
    var html_url: String = ""
    var followers_url: String = ""
    var following_url: String = ""
    var gists_url: String = ""
    var starred_url: String = ""
    var subscriptions_url: String = ""
    var organizations_url: String = ""
    var repos_url: String = ""
    var events_url: String = ""
    var received_events_url: String = ""
    var type: String = ""
    var site_admin: Bool = false
    var name: String = ""
    var email: String = ""
    var public_repos: Int = 0
    var public_gists: Int = 0
    var followers: Int = 0
    var following: Int = 0
    var created_at: String = ""
    var updated_at: String = ""
    init() {
    }
    
    init(dict: JSONDictionary) {
        
        if let login = dict["login"] as? String {
            self.login = login
        } else {
            print("Login failed")
        }
        if let id = dict["id"] as? Int {
            self.id = id
        } else {
            print("No id")
        }
        if let avatar_url = dict["avatar_url"] as? String {
            self.avatar_url = avatar_url
        } else {
            print("no avatar")
        }
        if let gravatar_id = dict["gravatar_id"] as? String {
            self.gravatar_id = gravatar_id
        } else {
            print("no gravatar")
        }
        if let url = dict["url"] as? String {
            self.url = url
        } else {
            print("no url")
        }
        if let html_url = dict["html_url"] as? String {
            self.html_url = html_url
        } else {
            print("no html_url")
        }
        if let followers_url = dict["followers_url"] as? String {
            self.followers_url = followers_url
        } else {
            print("no followers_url")
        }
        if let following_url = dict["following_url"] as? String {
            self.following_url = following_url
        } else {
            print("following_url")
        }
        if let gists_url = dict["gists_url"]  as? String {
            self.gists_url = gists_url
        } else {
            print("no gists")
        }
        if let starred_url = dict["starred_url"] as? String {
            self.starred_url = starred_url
        } else {
            print("no stars")
        }
        if let subscriptions_url = dict["subscriptions_url"] as? String {
            self.subscriptions_url = subscriptions_url
        } else {
            print("no subscriptions")
        }
        if let organizations_url = dict["organizations_url"] as? String {
            self.organizations_url = organizations_url
        } else {
            print("no organizations")
        }
        if let repos_url = dict["repos_url"] as? String {
            self.repos_url = repos_url
        } else {
            print("no repos")
        }
        if let events_url = dict["events_url"] as? String {
            self.events_url = events_url
        } else {
            print("no events")
        }
        if let received_events_url = dict["received_events_url"] as? String {
            self.received_events_url = received_events_url
        } else {
            print("received_events_url")
        }
        if let type = dict["type"] as? String {
            self.type = type
        } else {
            print("type")
        }
        if let site_admin = dict["site_admin"] as? Bool {
            self.site_admin = site_admin
        } else {
            print("no site admin")
        }
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            print("no name")
        }
        if let email = dict["email"] as? String {
            self.email = email
        } else {
            print("no email")
        }
        if let public_repos = dict["public_repos"] as? Int {
            self.public_repos = public_repos
        } else {
            print("no public repos")
        }
        if let public_gists = dict["public_gists"] as? Int {
            self.public_gists = public_gists
        } else {
            print("no public gists")
        }
        if let followers = dict["followers"] as? Int {
            self.followers = followers
        } else {
            print("no followers")
        }
        if let following = dict["following"] as? Int {
            self.following = following
        } else {
            print("not following")
        }
        if let created_at = dict["created_at"] as? String {
            self.created_at = created_at
        } else {
            print("not created")
        }
        if let updated_at = dict["updated_at"] as? String {
            self.updated_at = updated_at
        } else {
            print("not updated")
        }
    }
}
