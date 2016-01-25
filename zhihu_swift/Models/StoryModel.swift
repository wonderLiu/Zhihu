//
//  StoryModel.swift
//  zhihu_swift
//
//  Created by tarena45 on 16/1/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

import Foundation

protocol PastContentStoryItem {}

/** 侧滑菜单列表*/
struct ThemeModel : PastContentStoryItem {
    var id : String
    var name : String
    init(id : String, name : String) {
        self.id = id
        self.name = name
    }
}

/** 顶部滑动banner*/
struct TopStoryModel : PastContentStoryItem {
    var image : [String]
    var id : String
    var title : String
    init(images : [String], id : String, title : String) {
        self.image = images
        self.id = id
        self.title = title
    }
}
/** 主页故事列表*/
struct ContentStoryModel : PastContentStoryItem {
    var images : [String]
    var id : String
    var title : String
    init(images : [String], id : String, title : String) {
        self.images = images
        self.id = id
        self.title = title
    }
}

/** 主页故事列表 - 日期 */
struct DateHeaderModel : PastContentStoryItem {
    var date : String
    init(date : String) {
        self.date = date
    }
}





