//
//  ViewController.swift
//  A2_FA_iOS_Harpreet_c0788553
//
//  Created by user186844 on 1/30/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        return table
    } ()
    private var models = [FamousProducts]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CoreDate Famous Products"
        view.addSubview(tableView)
        getAllItems()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,target: self, action: #selector(didTapAdd))
        
        // Do any additional setup after loading the view.
    }
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: {_In
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else {
                return
            }
            self?.createItem(name: text)
        }))
        
            present(alert, animated: true)
            
      
        
    }
    func tableView(_tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
    UITableViewCell {
        let model = models[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model.name
        return cell
    }
    func tableView(_tableView: UITableView, didSelectRowAt indexPath: indexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        let item = models[indexPath.row]
        let sheet = UIAlertController(title: "Edit", message: nil,preferredStyle: .actionSheet)

        
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil),
                        sheet.addAction(UIAlertAction(title: "Edit", style: .cancel,handler: ( _ in}
    ))
    sheet.addAction(UIAlertAction(title: "Delete", style: .destructive,handler: ( -  in
    
    
    let alert = UIAlertController(title: "Edit Item", message: "Edit your item", preferredStyle: .alert)
    alert.addTextField(configurationHandler: nil)
    alert.textFields?.first?.text = item.name
    
    alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: { [weak self] _ in
        guard let field = alert.textFields?.first, let newName = field.text, !newname.isEmpty else {
            return
        }
    self?.updateItem(item: item, newName: newName)
    }))
    self.present(alert, animated: true)
    }))
    sheet.addAction(UIAlertAction(title: "Delete", style: .destructive,handler: { [weak self] _ in
    self?.deleteItem(item: item)
    }))
    
                                 present(sheet, animated: true)
        
    }
    
    //Core data
    func getAllItems() {
        do{
        models = try context.fetch(FamousProducts.fetchRequest())
            
            DispatchQueue.main.async {
                self.table.reloadData()
            }
        }
        catch {
            //error
            
        }
        
        
    }
    func createItem(name: String) {
        let newItem = FamousProducts(context: context)
        newItem.name = name
        newItem.id = id
        newItem.descriptionn = descriptionn
        newItem.price = price
        newItem.provider = provider
        do{
            try context.save()
        }
        catch {
        }
        
        
    }
    
    func deleteItem(item: FamousProducts) {
        context.delete(item)
        
        
        do{
            try context.save()
    getAllItems()
        }
        catch {
        }
        
        
        
    }  func displayItem() {
    arrItems.removeAll()
    arrItems = dataAccess.retrieveDataFromCoreData()
    if selected_subject != nil {
        arritems = arrItems.filter({$0.product_id == selected_product!.product_id})
    }
    sortingByUserPreference()
    
}
    
    
    
    func updateItem(item: FamousProducts, newName: String) {
        item.name = newName
        
        do{
            try context.save()
    getAllItems()
        }
        catch {
        }
        
    }
    func searchWithKeyword(key:String){
        searchInProgress = true
        filterArrItems.removeAll()
        let set = Set(arrItems.filter({($0.Item_title?.contains(key))!}) + arrNotes.filter({($0.Item_desc?.contains(key))!}))
        filterArrItems = Array(set)
        tableView.reloadData()
    }
    @IBAction func handleSortBy(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "CustomPopUpVC") as! CustomPopUpVC
        vc.arrItems = arrSortTypes
        vc.popupTitle = "Sort By"
        vc.delegate = self
        self.present(vc, animated: false)
    
    
    }
    @IBAction func handleSearchBar(){
        view.layoutIfNeeded()
        if topViewHeight.constant == 0{
            
            topViewHeight.constant = 56
        }
        else{
            topViewHeight.constant = 0
            searchInProgress = false
            tableView.reloadData()
        }
       
        
    }
    
    }
}
    
    
    
    
    
    
    
    
    
    



}
}
}
