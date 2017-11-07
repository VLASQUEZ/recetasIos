//
//  ViewController.swift
//  MisRecetas
//
//  Created by Andres on 29/10/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    var recipes : [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.        
        var recipe = Recipe(name: "Pizza",image : #imageLiteral(resourceName: "pizza"), time : 40,
                            ingredients:["Harina","Jamon","Pasta de tomate","Piña","Queso","sal"],
                            steps:["Agregar agua a la harina","Amasar la harina por 15 minutos","aplanar la masa",
                                   "poner ingredientes","hornear durante 10 minutos"])
        
        recipes.append(recipe)
        recipe = Recipe(name: "Lasagna", image : #imageLiteral(resourceName: "lasagna"),time : 50 ,
                        ingredients:["Carne o pollo","Jamon","Salsa bolognesa","pasta","Queso","sal"],
                        steps:["Agregar agua a la harina","Amasar la harina por 15 minutos","aplanar la masa",
                               "poner ingredientes","hornear durante 10 minutos"])
        recipes.append(recipe)
        recipe = Recipe(name: "Bandeja paisa", image : #imageLiteral(resourceName: "bandeja_paisa"),time: 30 ,
                        ingredients:["Frijol","Huevo","Arroz","Aguacate","Chicharron","sal","Chorizo","Carne molida", "Papa"],
                        steps:["Cocinar todo","Fritar el huevo","Comer"])
        recipes.append(recipe)
        recipe = Recipe(name: "Ajiaco", image : #imageLiteral(resourceName: "ajiaco"), time: 50,
                        ingredients:["agua","papa criolla","crema de leche","aguacate","alcaparras","sal","pollo","verduras", "Mazorca"],
                        steps:["Cocinar todo","Comer"])
        recipes.append(recipe)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        
        
        cell.imageView?.layer.cornerRadius = 42.0
        cell.imageView?.clipsToBounds = true
        return cell
    }
}
