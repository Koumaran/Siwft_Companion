//
//  ProfileModel.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 28/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import Foundation
import UIKit

struct Profile: Decodable {
    let id: Int
    let email: String
    let login: String
    let firstName: String
    let lastName: String
    let url: String
    let phone: String?
    let displayname: String
    let imageUrl: String
    let staff: Bool
    let correctionPoint: Int
    let poolMonth: String
    let poolYear: String
    let location: String?
    let wallet: Int
		let cursusUsers: [CursusUsers]
		let projectsUsers: [ProjectsUsers]
		let languagesUsers: [Language]
		let achievements: [Achievement]
		let titles: [Title]
		let titlesUsers: [Title]
		let expertisesUsers: [ExpertiseUser]
    
    private enum CodingKeys: String, CodingKey {
        case id, email,login, url, phone, displayname, location, wallet, achievements, titles
        case firstName = "first_name"
        case lastName = "last_name"
        case imageUrl = "image_url"
        case staff = "staff?"
        case correctionPoint = "correction_point"
        case poolMonth = "pool_month"
        case poolYear = "pool_year"
				case cursusUsers = "cursus_users"
				case projectsUsers = "projects_users"
				case languagesUsers = "languages_users"
			case titlesUsers = "titles_users"
			case expertisesUsers = "expertises_users"
    }
    
    var imageConverted : UIImage? {
        get {
            if let url = URL(string: imageUrl),
                let data = try? Data(contentsOf: url) {
                return UIImage(data: data)
            }
            return nil
        }
    }
}

struct CursusUsers: Decodable {
    let grade: String?
    let level: Double
		let skills: [Skills]
    let id: Int?
    let beginAt: String?
    let endAt: String?
    let cursusId: Int?
    let hasCoalition: Bool
		let user: User
		let cursus: Cursus
	
		private enum CodingKeys: String, CodingKey {
			case grade, level, skills, id, user, cursus
			case beginAt = "begin_at"
			case endAt = "end_at"
			case cursusId = "cursus_id"
			case hasCoalition = "has_coalition"
		}
}

struct Cursus: Decodable {
    let id: Int?
    let createdAt: String?
    let name: String?
    let slug: String?
	
		private enum CodingKeys: String, CodingKey {
			case id, name, slug
			case createdAt = "created_at"
		}
}
struct Skills: Decodable {
    let id: Int?
    let name: String?
    let level: Double?
}
struct ProjectsUsers:Decodable {
    let id: Int
    let occurrence: Int?
    let finalMark: Int?
		let status: String?
		let validated: Bool?
		let currentTeamId: Int?
		let project: Project?
		let cursusIds: [Int]?
		let markedAt: String?
		let marked: Bool?
	
		private enum CodingKeys: String, CodingKey {
			case id, occurrence, status, project, marked
			case finalMark = "final_mark"
			case validated = "validated?"
			case currentTeamId = "current_team_id"
			case cursusIds = "cursus_ids"
			case markedAt = "marked_at"
		}
}
struct Project: Decodable {
		let id: Int?
		let name: String?
		let slug: String?
		let parentId: Int?
	
		private enum CodingKeys: String, CodingKey {
			case id, name, slug
			case parentId = "parent_id"
		}
}
struct Language: Decodable {
		let id: Int?
		let languageId: Int?
		let userId: Int?
		let position: Int?
		let createdAt: String?
	
		private enum CodingKeys: String, CodingKey {
			case id, position
			case languageId = "language_id"
			case userId = "user_id"
			case createdAt = "created_at"
		}
}
struct Achievement: Decodable {
		let id: Int
		let name: String
		let description: String?
		let tier: String?
		let king: String?
		let visible: Bool?
		let image: String?
		let nbrOfSucces: Int?
		let userUrl: String?
	
		private enum CodingKeys: String, CodingKey {
			case id, name, description, tier, king, visible, image
			case nbrOfSucces = "nbr_of_success"
			case userUrl = "user_url"
		}
}
// Is Titles and Titles_users
struct Title: Decodable {
	let id: Int
	let name: String?
	let userId: Int?
	let titleId: Int?
	let selected: Bool?
	
	private enum CodingKeys: String, CodingKey {
		case id, name, selected
		case userId = "user_id"
		case titleId = "title_id"
	}
}
struct ExpertiseUser: Decodable {
	let id: Int
	let expertiseId: Int
	let interested: Bool
	let value: Int
	let contactMe: Bool
	let createdAt: String
	let userId: Int
	
	private enum CodingKeys: String, CodingKey {
		case id, interested, value
		case userId = "user_id"
		case expertiseId = "expertise_id"
		case contactMe = "contact_me"
		case createdAt = "created_at"
	}
}
struct Campus: Decodable {
	let id: Int
	let name: String
	let timeZone: String
	let language: Language
	let usersCount: Int
	let vogsphereId: Int
	let country: String
	let address: String
	let zip: String
	let city: String
	let website: String
	let facebook: String
	let twitter: String
	
	private enum CodingKeys: String, CodingKey {
		case id, name, language, country, address, zip, city, website, facebook, twitter
		case timeZone = "time_zone"
		case usersCount = "users_count"
		case vogsphereId = "vogsphere_id"
	}
}
