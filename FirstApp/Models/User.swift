import SwiftyJSON

struct User {
    var login: String
    var id: Int
    var avatarUrl: String?
    var gravatarId: String?
    var url: String?
    var htmlUrl: String?
    var followersUrl: String?
    var followingUrl: String?
    var gistsUrl: String?
    var starredUrl: String?
    var subscriptionsUrl: String?
    var organizationsUrl: String?
    var reposUrl: String?
    var eventsUrl: String?
    var receivedEventsUrl: String?
    var type: String?
    var siteAdmin: String?
    var name: String?
    var company: String?
    var blog: String?
    var location: String?
    var email: String?
    var hireable: String?
    var bio: String?
    var publicRepos: Int?
    var publicGists: Int?
    var followers: Int?
    var following: Int?
    var createdAt: Date?
    var updatedAt: Date?

    init?(json: JSON) {
        guard let _id = json["id"].int,
            let _login = json["login"].string else {
            return nil
        }
        login = _login
        id = _id
        avatarUrl = json["avatar_url"].string
        gravatarId = json["gravatar_id"].string
        url = json["url"].string
        htmlUrl = json["html_url"].string
        followersUrl = json["followers_url"].string
        followingUrl = json["following_url"].string
        gistsUrl = json["gists_url"].string
        starredUrl = json["starred_url"].string
        subscriptionsUrl = json["subscriptions_url"].string
        organizationsUrl = json["organizations_url"].string
        reposUrl = json["repos_url"].string
        eventsUrl = json["events_url"].string
        receivedEventsUrl = json["received_events_url"].string
        type = json["type"].string
        siteAdmin = json["site_admin"].string
        name = json["name"].string
        company = json["company"].string
        blog = json["blog"].string
        location = json["location"].string
        email = json["email"].string
        hireable = json["hireable"].string
        bio = json["bio"].string
        publicRepos = json["public_repos"].int
        publicGists = json["public_gists"].int
        followers = json["followers"].int
        following = json["following"].int
        createdAt = json["created_at"].string?.toDate()
        updatedAt = json["updated_at"].string?.toDate()
    }
}
