//
//  ViewController.swift
//  pushJuanjo
//
//  Created by Juanjo
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate
{
    @IBOutlet var myChat: UITableView!
    @IBOutlet var mensajeTF: UITextField!
    @IBOutlet var enviarBT: UIButton!
    var messages = [(String,String)]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myChat.delegate = self
        myChat.dataSource = self
        mensajeTF.delegate = self
        self.tapGesture()

        NotificationCenter.default.addObserver(self, selector: #selector(receiveMessage(notificacion:)), name: Notification.Name("notification"), object: nil)
    }
    
    func tapGesture()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.view.addGestureRecognizer(tapGesture)
    }
    @objc func tapped(sender: UITapGestureRecognizer)
    {
        DispatchQueue.main.async{}
        self.view.endEditing(true)
    }
    
    @objc func receiveMessage(notificacion:Notification)
    {
        var message = notificacion.userInfo!["mensaje"] as! String
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        messages.append((message,format.string(from: date)))
        myChat.reloadData()
    }
    
    var enviado = false
    @IBAction func sendMessage(_ sender: Any)
    {
        self.view.endEditing(true)
        let message = mensajeTF.text!
        let date = Date()
        let format = DateFormatter()
        mensajeTF.text = ""
        format.dateFormat = "HH:mm"
        enviado = true
        if message != ""
        {
            messages.append((message,format.string(from: date)))
            myChat.reloadData()
        }
        DispatchQueue.main.async
        {
            self.myChat.reloadData()
        }
        print(messagesArray)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if enviado == false
        {
            let cell = myChat.dequeueReusableCell(withIdentifier: "receiveMess", for: indexPath) as! MyCell
            cell.messLB.text = messages[indexPath.row].0
            cell.messLB.textAlignment = .left
            cell.backgroundColor = UIColor.yellow
            cell.messLB.textColor = .black
            return cell
        } else
        {
            let cell = myChat.dequeueReusableCell(withIdentifier: "sendMess", for: indexPath) as! MyCell
            cell.messSLB.text = messages[indexPath.row].0
            cell.backgroundColor = UIColor.green
            cell.messSLB.textAlignment = .right
            cell.messSLB.textColor = .white
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //borrar
    func tableView ( _  tableView : UITableView , commit  editStyle : UITableViewCell .EditingStyle , forRowAt  indexPath : IndexPath )
    {
        if  editStyle == UITableViewCell .EditingStyle .delete
        {
            messages.remove ( at : indexPath .row )
            tableView.deleteRows(at:[ indexPath ],with:UITableView .RowAnimation .automatic )
        }
    }
}
