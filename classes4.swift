import Foundation

enum Privacy: String {
    case privatePost = "for himself"
    case friends = "for his friends"
    case friendsOfFriends = "for his friends and friends of friends"
    case publicPost = "for everyone"
    case groupMembers = "for a group"
}

enum Month: Int {
    case Jan = 1
    case Feb
    case Mar
    case Apr
    case May
    case Jun
    case Jul
    case Aug
    case Sep
    case Oct
    case Nov
    case Dec

    func getMonth() -> String {
        var month = ""
        switch self {
            case .Jan:
                month = "January"
            case .Feb:
                month = "February"
            case .Mar:
                month = "March"
            case .Apr:
                month = "April"
            case .May:
                month = "May"
            case .Jun:
                month = "June"
            case .Jul:
                month = "July"
            case .Aug:
                month = "August"
            case .Sep:
                month = "September"
            case .Oct:
                month = "October"
            case .Nov:
                month = "November"
            case .Dec:
                month = "December"
        }
        return month
  }
}

struct Date {
    var day: Int
    var month: Int
    var year: Int
}

struct Header {
    var author: String
    var date: Date
    var privacy: String
}

func numberHelper(_ x: Int) -> String{
    var str = "\(x)"
    if (x >= 1000000){
        var y = Float(x)/1000000
        str = "\(String(format:"%.2f", y))m"
    }
    else if (x >= 1000){
        var y = Float(x)/1000
        str = "\(String(format:"%.2f", y))k"
    }
    else if (x==0){
        str = "no"
    }
    return str
}

func dateHelper(_ date: Date) -> String{
    var numeral = "th"
    if ((date.day%10 == 1)&&(date.day != 11)){
        numeral = "st"
    }
    else if ((date.day == 2)||(date.day == 22)){
        numeral = "nd"
    }
    else if ((date.day == 3)||(date.day == 23)){
        numeral = "rd"
    }
    let month = Month(rawValue: date.month) ?? Month.Jan
    var str = "\(date.day)\(numeral) of \(month.getMonth()) \(date.year)"
    return str
}

class Post {
    var header: Header
    var content: String
    var reactions: Int
    var comments: Int
    var shares: Int
    init(header: Header, content: String, reactions: Int, comments: Int, shares: Int){
        self.header = header
        self.content = content
        self.reactions = reactions
        self.comments = comments
        self.shares = shares
    }
    func printPost(){
        print("User \(header.author) on \(dateHelper(header.date)) posted \(header.privacy): \"\(content)\". He received: " + 
    "\(numberHelper(reactions)) reactions, \(numberHelper(comments)) comments and \(numberHelper(shares)) shares.")
    }
}

class SharingPost: Post{
    var shareHeader: Header
    var shareReactions: Int
    var shareComments: Int
    init(shareHeader: Header, shareReactions: Int, shareComments: Int, header: Header, content: String, reactions: Int, comments: Int, shares: Int){
        self.shareHeader = shareHeader
        self.shareReactions = shareReactions
        self.shareComments = shareComments
        super.init(header: header, content: content, reactions: reactions, comments:comments, shares: shares)
    }
    func printSharingPost(){
        print("User \(shareHeader.author) on \(dateHelper(shareHeader.date)) shared \(shareHeader.privacy) a post: ")
        super.printPost()
    }
}

var posts = [Post]()
posts.append(Post(header: Header(author: "Tomasz Gumiś", date: Date(day: 3, month: 3, year: 2021), privacy: Privacy.friendsOfFriends.rawValue), 
content: "Swift is great.", reactions: 3534518, comments: 73234, shares: 212))
posts.append(Post(header: Header(author: "Sigismund Dijkstra", date: Date(day: 18, month: 5, year: 2015), privacy: Privacy.publicPost.rawValue), 
content: "Wolna Redania!", reactions: 1000, comments: 0, shares: 2))
for post in posts {
    post.printPost()
}

//print("\n\n")

var sharingPosts = [SharingPost]()
sharingPosts.append(SharingPost(shareHeader: Header(author: "Piotr Kowalski", date: Date(day: 1, month: 4, year: 2022), privacy: Privacy.friends.rawValue), 
shareReactions: 20, shareComments: 70, header: Header(author: "Jan Zły", date: Date(day: 1, month: 4, year: 2022), privacy: Privacy.friendsOfFriends.rawValue), 
content: "Swift is not great.", reactions: 1000, comments: 73215, shares: 212))
sharingPosts.append(SharingPost(shareHeader: Header(author: "Piotr Kowalski", date: Date(day: 2, month: 4, year: 2022), privacy: Privacy.friends.rawValue), 
shareReactions: 212, shareComments: 700, header: Header(author: "Jan Zły", date: Date(day: 2, month: 4, year: 2022), privacy: Privacy.friendsOfFriends.rawValue), 
content: "April fools!", reactions: 1000000, comments: 870321, shares: 3321))
for sharingPost in sharingPosts{
    sharingPost.printSharingPost()
    //print("\n")
}
print("\n\n")
