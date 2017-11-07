//
//  ViewController.swift
//  MisRecetas
//
//  Created by Andres on 23/10/17.
//  Copyright © 2017 Andres. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var recipes : [Recipe] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnSwipe = true

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellId = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RecipeCell
        cell.recipeImg.image = recipe.image
        cell.recipeName.text = recipe.name
        cell.recipeTime.text = "\(recipe.time!) min"
        cell.recipeIngredientes.text = "Ingredientes \(recipe.ingredients.count)"
        /*cell.recipeImg.layer.cornerRadius = 42.0
        cell.recipeImg.clipsToBounds = true*/
        
        /*if recipe.isFavorite{
            cell.accessoryType = .checkmark
        }
        else{
            cell.accessoryType = .none
        }*/
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete){
            self.recipes.remove(at: indexPath.row)
        }
        self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "Estoy viendo la receta \(self.recipes[indexPath.row].name)"
            let activityController = UIActivityViewController(activityItems:[shareDefaultText], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        shareAction.backgroundColor = UIColor.init(red: 30.0/255.0, green: 164.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        //Borrar
        let deleteAction = UITableViewRowAction(style: .default, title: "Eliminar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.top)


        }
        return [shareAction,deleteAction]
    }
    
    //MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /*let recipe = self.recipes[indexPath.row]

        let alertController = UIAlertController(title:recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        var favText = "Receta Favorita "
        var favStyle = UIAlertActionStyle.default
        if recipe.isFavorite{
            favText = "Ya no es Favorita :("
            favStyle = UIAlertActionStyle.destructive
        }
        let fav = UIAlertAction(title: favText, style: favStyle) { (action) in
            recipe.isFavorite = !recipe.isFavorite
            self.tableView.reloadData()
        }
        alertController.addAction(cancel)
        alertController.addAction(fav)
        
        self.present(alertController, animated: true, completion: nil)*/
        
        
    }
    //Enviar informacion entre viewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sendRecipeSegue")
        {
            if let indexPath = self.tableView.indexPathForSelectedRow{
                let selectedRecipe = self.recipes[indexPath.row]
                //Es destinationViewController en swift 3
                let destinaionViewController = segue.destination as! DetailViewController
                destinaionViewController.recipe = selectedRecipe
            }
            
        }
    }
}

