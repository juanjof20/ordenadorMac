//
//  ViewController.swift
//  ikea
//
//  Created by A4-iMAC03 on 22/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, ARSCNViewDelegate
{
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var itemsCollectionView: UICollectionView!
    @IBOutlet var planoDetectado: UILabel!
    let configuration = ARWorldTrackingConfiguration()
    let itemsArray: [String] = ["taza", "vasija", "mesa", "balón"]
    var selectedItem: String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.itemsCollectionView.dataSource = self
        self.itemsCollectionView.delegate = self
        self.sceneView.delegate = self
        self.planoDetectado.isHidden = true
        self.configuration.planeDetection = .horizontal
        self.registerGestureRecognizers()
        self.sceneView.session.run(configuration)
        self.sceneView.autoenablesDefaultLighting = true
    }
    
    func registerGestureRecognizers()
    {
        //Reconocer las pulsaciones
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
        
        //Reconocer los pinch
        let pinchGesturerecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinched))
        self.sceneView.addGestureRecognizer(pinchGesturerecognizer)
        
        //Reconocer la pulsacion larga
        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(rotate))
        self.sceneView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    @objc func rotate(sender: UITapGestureRecognizer)
    {
        let sceneView = sender.view as! ARSCNView
        let tapLocation = sender.location(in: sceneView)
        let hitTest = sceneView.hitTest(tapLocation)
        
        if !hitTest.isEmpty
        {
            let result = hitTest.first!
            let node = result.node
            if sender.state == .began
            {
                let rotation = SCNAction.rotateBy(x: 0, y: CGFloat(360.degreeToRadians), z: 0, duration: 2)
                let forever = SCNAction.repeatForever(rotation)
                result.node.runAction(forever)
            } else if sender.state == .ended
            {
                result.node.removeAllActions()
            }
        }
    }
    
    @objc func pinched(sender: UIPinchGestureRecognizer)
    {
        //Redimensionar
        let sceneView = sender.view as! ARSCNView
        let pinchLocation = sender.location(in: sceneView)
        let hitTest = sceneView.hitTest(pinchLocation)
        
        if !hitTest.isEmpty
        {
            let result = hitTest.first!
            let node = result.node
            let pinchnAction = SCNAction.scale(by: sender.scale, duration: 0)
            print(sender.scale)
            node.runAction(pinchnAction)
            sender.scale = 1.0
        }
    }
    
    @objc func tapped(sender: UITapGestureRecognizer){
//        //Comprueba que funciona el gesture recognizer
//        print("Has tocado el SceneView")        
        let sceneView = sender.view as! ARSCNView
        let tapLocation = sender.location(in: sceneView)
        let hitTest = sceneView.hitTest(tapLocation, types: .existingPlaneUsingExtent)
        if !hitTest.isEmpty
        {
            print("es una superficie horizontal")
            self.addItem(hitTestResult: hitTest.first!)
        } else
        {
            print("no hay superficies")
        }
    }
    
    func addItem(hitTestResult: ARHitTestResult)
    {
        if let selectedItem = self.selectedItem
        {
            let scene = SCNScene(named: "\(selectedItem).scn")
            let node = (scene?.rootNode.childNode(withName: selectedItem, recursively: false))
            let transform = hitTestResult.worldTransform
            let terceraColumna = transform.columns.3
            node?.position = SCNVector3(terceraColumna.x, terceraColumna.y, terceraColumna.z)
            if selectedItem == "mesa"
            {
                self.centerPivot(for: node!)
            }
            self.sceneView.scene.rootNode.addChildNode(node!)
        }
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor)
    {
        guard anchor is ARPlaneAnchor else {return}
        DispatchQueue.main.async
        {
            self.planoDetectado.isHidden = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 3)
            {
                self.planoDetectado.isHidden = true
            }
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return itemsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! itemCell
        cell.itemLabel.text = self.itemsArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.yellow
        self.selectedItem = itemsArray[indexPath.row]
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath)
    {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.backgroundColor = UIColor.blue
    }

    func centerPivot(for node: SCNNode)
    {
        let min = node.boundingBox.min
        let max = node.boundingBox.max
        node.pivot = SCNMatrix4MakeTranslation(min.x + (max.x - min.x)/2, min.y + (max.y - min.y)/2, min.z + (max.z - min.z)/2)
    }
    
    @IBAction func resetBT(_ sender: Any)
    {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes
        {(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    }
}

extension Int
{
    var degreeToRadians: Double {return Double(self) * .pi / 180}
}

//icono app, precio de los productos y poner el coste total de lo dibujado, boton reset, dibujar plano, posible menu lateral
//
