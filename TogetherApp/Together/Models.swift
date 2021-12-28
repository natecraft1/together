////
////  Models.swift
////  Together
////
////  Created by Nathan Glass on 12/18/21.
////
//import DateHelper
//import Foundation
//
//struct MonthYear: Hashable {
//    var month: Int
//    var year: Int
//}
//
//struct MonthDay: Hashable {
//    var month: Int
//    var day: Int
//}
//
//struct MonthSection: Identifiable {
//    var id = UUID()
//    var monthAbbreviation: String
//    var days: [DaySection]
//}
//
//struct DaySection: Identifiable {
//    var id = UUID()
//    var dayAbbreviation: String
//    var posts: [Post]
//}
//
//extension MonthSection {
//    static func create(n: Int) -> [MonthSection] {
//        let months = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"]
//        let calendar = Calendar(identifier: .gregorian)
//        let monthYearCache: [MonthYear: [Post]] = Dictionary(grouping: Post.createModels(n: n)) { post -> MonthYear in
//            let cal = calendar.dateComponents([.year, .month], from: post.date)
//            return MonthYear(month: cal.month!, year: cal.year!)
//        }
//        return monthYearCache.map { my, posts in
//            (my, posts)
//        }.sorted(by: { pair1, pair2 in
//            if pair1.0.year == pair2.0.year {
//                return pair1.0.month > pair2.0.month
//            } else {
//                return pair1.0.year > pair2.0.year
//            }
//        }).compactMap { monthYear, posts in
//            guard monthYear.month < 13 else { return nil }
//            let daySections: [DaySection] = Dictionary(grouping: posts, by: { post -> MonthDay in
//                let cal = calendar.dateComponents([.day, .month], from: post.date)
//                return MonthDay(month: cal.month!, day: cal.day!)
//            }).sorted { pair1, pair2 in
//                if pair1.0.month == pair2.0.month {
//                    return pair1.0.day > pair2.0.day
//                } else {
//                    return pair1.0.month > pair2.0.month
//                }
//            }.compactMap { monthDay, posts in
//                return DaySection(dayAbbreviation: String(monthDay.day), posts: posts.sorted { $0.date > $1.date })
//            }
//
//            return MonthSection(monthAbbreviation: months[monthYear.month - 1], days: daySections)
//        }
//    }
//}
//
//struct Post: Identifiable, Hashable {
//    var id = UUID()
//    var title: String?
//    var text: String?
//    var date: Date
//    var images: [String]
//}
//
//extension Post {
//    static func createModels(n: Int = 12) -> [Post] {
//        var postTitles = ["Levi Pics", "First smile", "Levi's Birth Story", "Family day out", "Weekend Hike", "Trip to Florida", "Baby Steps", "Random Pics", "Happy Times"]
//        var loremIpsum = [
//            "I'm baby meh celiac authentic wolf flannel fingerstache artisan typewriter letterpress tbh VHS. Waistcoat offal messenger bag selfies. Banjo cardigan gluten-free, umami +1 fingerstache fashion axe. Woke dreamcatcher vexillologist health goth vice.",
//            "Crucifix church-key kogi quinoa, twee ugh palo santo ennui distillery. Dreamcatcher echo park sartorial, vice man braid chicharrones raw denim succulents paleo keffiyeh single-origin coffee master cleanse.",
//            "Helvetica shaman 90's williamsburg tousled, post-ironic austin pabst. Four loko intelligentsia drinking vinegar craft beer. Pitchfork thundercats edison bulb lumbersexual church-key af master cleanse.",
//            "Kale chips fixie DIY street art tbh affogato asymmetrical aesthetic waistcoat cloud bread. Church-key kale chips neutra celiac art party.",
//            "Adaptogen brooklyn meh, locavore four loko schlitz thundercats coloring book four dollar toast truffaut selvage gluten-free food truck. Green juice aesthetic paleo etsy post-ironic truffaut tofu."
//        ]
//        var d = Date()
//        return (0..<n).map { num -> Post in
//            let date = d.adjust(.day, offset: Int.random(in: -35 ..< 1)).adjust(.minute, offset: Int.random(in: -200...200))
//            d = date
//            let title = num % 3 == 0 ? nil : (postTitles.isEmpty ? nil : postTitles.removeFirst())
//            let text = !loremIpsum.isEmpty && num % 4 == 0 ? loremIpsum.removeFirst() : nil
//            let images: [String] = (1...19).map { $0 }.shuffled().prefix(Int.random(in: 4...7)).map(String.init)
//
//            return Post(title: title, text: text, date: date, images: images)
//        }
//    }
//}
//
//struct FeedPost: Identifiable {
//    var id = UUID()
//    var author: String
//    var title: String?
//    var text: String?
//    var date: Date
//    var images: [String]
//}
//
//extension FeedPost {
//    static func createModels(n: Int = 12) -> [FeedPost] {
//        var postTitles = ["Levi Pics", "First smile", "Levi's Birth Story", "Family day out", "Weekend Hike", "Trip to Florida", "Baby Steps", "Random Pics", "Happy Times"]
//        var loremIpsum = [
//            "I'm baby meh celiac authentic wolf flannel fingerstache artisan typewriter letterpress tbh VHS. Waistcoat offal messenger bag selfies. Banjo cardigan gluten-free, umami +1 fingerstache fashion axe. Woke dreamcatcher vexillologist health goth vice.",
//            "Crucifix church-key kogi quinoa, twee ugh palo santo ennui distillery. Dreamcatcher echo park sartorial, vice man braid chicharrones raw denim succulents paleo keffiyeh single-origin coffee master cleanse.",
//            "Helvetica shaman 90's williamsburg tousled, post-ironic austin pabst. Four loko intelligentsia drinking vinegar craft beer. Pitchfork thundercats edison bulb lumbersexual church-key af master cleanse.",
//            "Kale chips fixie DIY street art tbh affogato asymmetrical aesthetic waistcoat cloud bread. Church-key kale chips neutra celiac art party.",
//            "Adaptogen brooklyn meh, locavore four loko schlitz thundercats coloring book four dollar toast truffaut selvage gluten-free food truck. Green juice aesthetic paleo etsy post-ironic truffaut tofu."
//        ]
//        var d = Date()
//        return (0..<n).map { num -> FeedPost in
//            let date = d.adjust(.day, offset: Int.random(in: -35 ..< 1)).adjust(.minute, offset: Int.random(in: -200...200))
//            d = date
//            let title = num % 3 == 0 ? nil : (postTitles.isEmpty ? nil : postTitles.removeFirst())
//            let text = !loremIpsum.isEmpty && num % 4 == 0 ? loremIpsum.removeFirst() : nil
//            let images: [String] = (1...19).map { $0 }.shuffled().prefix(Int.random(in: 4...7)).map(String.init)
//            let names = ["Dwight and Angela", "Kevin and Stacy", "Jim and Pam", "Ryan and Kelly", "The Flendersons", "Michael and Holly", "Andy and Erin"]
//            return FeedPost(author: names[Int.random(in: 0..<names.count)], title: title, text: text, date: date, images: images)
//        }
//    }
//}
//
//
//extension Invite {
//    static func create(n: Int = 4) -> [Invite] {
//        var names = ["Dwight and Angela", "Kevin and Stacy", "Jim and Pam", "Ryan and Kelly", "The Flendersons"]
//        var d = Date()
//        return (0..<min(n, 5)).map { _ -> Invite in
//            let date = d.adjust(.day, offset: Int.random(in: -25 ..< 0)).adjust(.minute, offset: Int.random(in: -200...200))
//            d = date
//            return Invite(name: names.removeFirst(), date: date)
//        }
//    }
//}
//
//extension Date {
//    var day: Int {
//        let calendarDate = Calendar.current.dateComponents([.day], from: self)
//        return calendarDate.day!
//    }
//}
