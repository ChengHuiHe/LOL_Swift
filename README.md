# LOL_Swift
一个简单的swift小项目，适合入门者学习！采用MVC开发。
 https://github.com/ChengHuiHe/LOL_Swift/raw/master/hero.png

 ## Model 
  init(dict : [String: AnyObject]) {
        
        super.init()
        // 字典转模型
        setValuesForKeysWithDictionary(dict)
    }
    
    // 重写方法, 重写方法防止奔溃
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
        print("这个方法保证程序不退出的")
        return
    }

   // 注册cell
    tableView.registerNib(UINib.init(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")

![image](https://github.com/ChengHuiHe/LOL_Swift/raw/master/hero.png)
