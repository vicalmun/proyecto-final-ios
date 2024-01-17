//
//  LeaderBoard.swift
//  HabitTracker
//
//  Created by Víctor Alba on 10/11/23.
//

import Foundation

struct LeaderBoard {
    let id: Int
    let createdByUserId: Int
    let sharedHabitId: Int
    var participatingUsersId: [Int]
}
