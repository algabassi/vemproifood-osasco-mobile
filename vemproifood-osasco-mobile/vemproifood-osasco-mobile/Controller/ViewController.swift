//
//  ViewController.swift
//  ChooseFood
//
//  Created by Alexandre Gabassi on 21/11/18.
//  Copyright © 2018 Alexandre Gabassi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var NomesTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DispatchQueue.main.async(execute: {
            self.buscaListaNomes()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaNomes.listaNomes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "FoodTableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? FoodTableViewCell
        if cell == nil {
            
            tableView.register(UINib(nibName: "FoodTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
            cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as! FoodTableViewCell)
        }
        
        if listaNomes.listaNomes.count > 0 {
            if let strNome = listaNomes.listaNomes[indexPath.row].nomePrato {
             cell?.nomePrato.text = strNome
            }
        }
        return cell!
    }
}

extension ViewController {
    
    func buscaListaNomes() {
        
        gChamadosRequests.pesquisaLista( completionHandler: { (success) -> Void in
            if success {
                DispatchQueue.main.async(execute: {
                    self.gModal.hideActivityIndicator(uiView: self.view, completionHandler: { (success) -> Void in
                        if success {
                            DispatchQueue.main.async(execute: {
                                self.listaChamadosTableView.reloadData()
                            })
                        }
                    })
                })
            } else {
                self.trataRetornoInterface()
            }
        })
}

