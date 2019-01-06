//
//  HomeController.swift
//  LoginPageExample
//
//  Created by Jon McLean on 6/1/19.
//  Copyright © 2019 Jon McLean Development. All rights reserved.
//

import UIKit

class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var topView: UIImageView = UIImageView()
    var tableView: UITableView = UITableView()
    
    var exampleData: [String] = ["Fashion", "Entertainment", "Sports", "Travelling", "Science", "Shopping", "Technologies", "Finances", "Programming", "Celebrities"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        
        
        topView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height / 3 - 100))
        topView.image = UIImage(named: "background2")!
        topView.addBlurEffect()
        topView.contentMode = .scaleAspectFill
        self.view.addSubview(topView)
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height - topView.bounds.height))
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        layoutViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.title = "Overview"
        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController!.navigationBar.shadowImage = UIImage()
        self.navigationController!.navigationBar.isTranslucent = true
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white, NSAttributedString.Key.font:UIFont(name: "Courier New", size: 20)]
        self.navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    func layoutViews() {
        topView.snp.makeConstraints { (make) in
            make.width.equalTo(topView.bounds.width)
            make.height.equalTo(topView.bounds.height)
            make.top.equalTo(self.view.snp.top)
            make.left.right.equalTo(self.view)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.width.equalTo(tableView.bounds.width)
            make.height.equalTo(tableView.bounds.height)
            make.top.equalTo(topView.snp.bottom)
            make.centerX.equalTo(self.view)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = exampleData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
    
}
