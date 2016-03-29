//
//  ViewController.swift
//  LOL_Swift
//
//  Created by Chenghui on 16/3/16.
//  Copyright © 2016年 Chenghui. All rights reserved.
// 如果你喜欢，顺便给个star！！！谢谢！
// https://github.com/ChengHuiHe/LOL_Swift.git

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    // 初始化
    var heroArray:NSMutableArray = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 封装方法
        layoutView()

    }

// MARK: 加载数据
    func layoutView(){
        // 注册cell
        tableView.registerNib(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        // 取出Plist url
        let fileUrl = NSBundle.mainBundle().URLForResource("heros", withExtension: "plist")
        // 到出数组
        let dataArr = NSArray(contentsOfURL: fileUrl!)
        // 快速遍历出数组中的字典
        for dic in dataArr!{
            // 创建对象( //字典转模型)
            let model = Model(dict: dic as! [String : AnyObject])
            
            // 将快速枚举值进行类型转换
//            let dica:Dictionary<String,AnyObject> = dic as! Dictionary        
//            // 数据转模型
//            model.setValuesForKeysWithDictionary(dica)
            
            // 添加入数组中
            heroArray.addObject(model)
        }
    }
    
    
    
// MARK: --- 数据源
    //返回多少组
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    // 行数
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroArray.count;
    }
    // cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // 重用
        let cell:MyTableViewCell =  tableView.dequeueReusableCellWithIdentifier("MyTableViewCell", forIndexPath: indexPath) as! MyTableViewCell
        // 取消选中变黑
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        // 取出对象
        let model = heroArray[indexPath.row] as! Model
        // 赋值
        cell.titleLabel.text = model.name
        cell.imageView?.image = UIImage(named: model.icon!)
        cell.introLabel.text = model.intro;
        return cell
    }
    
    // 返回的高度
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90;
    }
    
    
    func tableView( tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        //删除数据源的对应数据
        heroArray.removeObjectAtIndex(indexPath.row)
        
        //删除对应的cell
        self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        
    }
    

    
}

