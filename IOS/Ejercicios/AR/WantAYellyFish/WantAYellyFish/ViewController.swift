//
//  ViewController.swift
//  WantAYellyFish
//
//  Created by A1-IMAC08 on 16/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController
{
    @IBOutlet var sceneView: ARSCNView!
    @IBOutlet var playBT: UIButton!
    @IBOutlet var resetBT: UIButton!
    @IBOutlet var tiempoLB: UILabel!
    var temp = Each(1).seconds
    var cuenta = 10
    let configuration = ARWorldTrackingConfiguration()
    
    @IBAction func playBTAC(_ sender: Any)
    {
        self.setTiempo()
        addNode()
        self.playBT.isEnabled = false
    }
    
    @IBAction func resetBTAC(_ sender: Any)
    {
        self.temp.stop()
        self.reiniciarTiempo(fin: true)
        self.playBT.isEnabled = true
        sceneView.scene.rootNode.enumerateChildNodes
        { (node, _) in
            node.removeFromParentNode()
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.sceneView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func setTiempo()
    {
        self.temp.perform
        { () -> NextStep in
            self.cuenta -= 1
            self.tiempoLB.text = String(self.cuenta)
            if self.cuenta == 0
            {
                self.tiempoLB.text = "Game Over"
                return .stop
            }
            return .continue
        }
    }
    
    func addNode()
    {
//        let node = SCNNode(geometry: SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0))
//        node.position = SCNVector3(0,0,-1)
//        node.name = "Cubo Blanco"
//        self.sceneView.scene.rootNode.addChildNode(node)
        
        let jfScene = SCNScene(named: "art.scnassets/Jellyfish.scn")
        let jfNode = jfScene?.rootNode.childNode(withName: "Sphere", recursively: false)
//        jfNode?.position = SCNVector3(0,0,-1)
        jfNode?.position = SCNVector3(randomNumbers(firstNum: -1, secondNum: 1), randomNumbers(firstNum: -0.5, secondNum: 0.5), randomNumbers(firstNum: -1, secondNum: 1))
        jfNode?.name = "Medusa"
//        jfNode?.geometry?.materials(named: "")
        self.sceneView.scene.rootNode.addChildNode(jfNode!)
    }

    ///Visible desde objetiveC
    @objc func handleTap(sender: UITapGestureRecognizer)
    {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        
        if hitTest.isEmpty
        {
            print("No has tocado nada")
        } else
        {
            if cuenta > 0
            {
                let results = hitTest.first! ///para que detecte que es el primer objeto en tocar
                let nodeName = results.node.name
                print("Has tocado: \(nodeName!)")
                
                let node = results.node
                
                if node.animationKeys.isEmpty
                {
                    SCNTransaction.begin()
                    self.animateNode(node: node)
                    SCNTransaction.completionBlock =
                    {
                        node.removeFromParentNode()
                        self.addNode() //Añadimos nuevo nodo
                        //Reiniciar el tiempo
                        self.reiniciarTiempo()
                    }
                    SCNTransaction.commit()
                }
            }
        }
    }
    
    func reiniciarTiempo(fin: Bool = false)
    {
        self.cuenta = 10
        if fin == false
        {
            self.tiempoLB.text = String(self.cuenta)
        } else
        {
            self.tiempoLB.text = "Try Again!!"
        }
    }
    
    func animateNode(node: SCNNode)
    {
        let spin = CABasicAnimation(keyPath: "position")
        spin.fromValue = node.presentation.position // Posicion inicial del nodo
//        spin.toValue = SCNVector3(0, 0, -2) // Lo movemos 1 metro hacia atras
//        spin.toValue = SCNVector3(0, 0, node.presentation.position.z - 1)
        spin.toValue = SCNVector3(node.presentation.position.x - 0.2, node.presentation.position.y - 0.2, node.presentation.position.z - 0.2)
        spin.duration = 0.05
        spin.autoreverses = true
        spin.repeatCount = 5
        node.addAnimation(spin, forKey: "position")
    }
    
    //Generar numero aleatorio
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
