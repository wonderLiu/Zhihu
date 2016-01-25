//
//  WLDataManager.swift
//  zhihu_swift
//
//  Created by tarena45 on 16/1/25.
//  Copyright © 2016年 tarena. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

/**
void test() {
int b = 0
static int a = 0 //全局区，程序开始时就创建，只是a只能在方法中访问，
}
*/

//只读计算属性
var dataManager : DataManager {
    get {
        struct Singleton {
            static var predicate : dispatch_once_t = 0
            static var instance : DataManager? = nil
        }
        dispatch_once(&Singleton.predicate, { () -> Void in
            Singleton.instance = DataManager()
        })
        return Singleton.instance!
    }
}

class DataManager {
//    class func getInstance() -> DataManager {
//        struct Singleton {
//            static var predicate : dispatch_once_t = 0
//            static var instance : DataManager? = nil
//        }
//        dispatch_once(&Singleton.predicate, { () -> Void in
//            Singleton.instance = DataManager()
//        })
//        return Singleton.instance!
//    }
    /**侧滑界面列表*/
    var themes : [ThemeModel] = []
    /** 顶部新闻*/
    var topStory : [TopStoryModel] = []
    /** 当日新闻*/
    var contentStory : [ContentStoryModel] = []
    /** 旧新闻*/
    var pastContentStory : [PastContentStoryItem] = []
    var offsetYValue : [(CGFloat,String)] = []
    
    /** 临时数据，修改使用*/
    /**侧滑界面列表*/
    var tempThemes : [ThemeModel] = []
    /** 顶部新闻*/
    var tempTopStory : [TopStoryModel] = []
    /** 当日新闻*/
    var tempContentStory : [ContentStoryModel] = []
    /** 旧新闻*/
    var tempPastContentStory : [PastContentStoryItem] = []
    
    //MARK:取得主题日报数据
    func getThemesDatas(completion : (themes : [ThemeModel])->()) {
        Alamofire.request(.GET, requestThemes).responseJSON(completionHandler: { [unowned self] (response) -> Void in
            guard response.result.error == nil
                else {
                print("主题日报数据获取失败")
                return
            }
//            let data = JSON(response.result.value!)
//            NSLog("------- \(data)")
//            for i in 0..<data.count {
//                self.themes.append(ThemeModel(id: String(data[i]["id"]), name: String(data[i]["name"])))
//            }
            let data = JSON(response.result.value!)["others"]
            NSLog("------- \(data)")
            for i in 0..<data.count {
                self.themes.append(ThemeModel(id: String(data[i]["id"]) , name: String(data[i]["name"])))
            }
            completion(themes: self.themes)
            })
    }
    func loadImage(name : String, completion : (image : UIImage) -> ()) {
        let image = UIImage(named: name)
        completion(image: image!)
    }
}

