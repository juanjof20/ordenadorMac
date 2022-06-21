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
    var cuenta = 20
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
                self.tiempoLB.text = "Game Over :("
                return .stop
            }
            return .continue
        }
    }
    
    func addNode()
    {
        let jfScene = SCNScene(named: "art.scnassets/covid.scn")
        let jfNode = jfScene?.rootNode.childNode(withName: "Covid", recursively: false)
        jfNode?.position = SCNVector3(randomNumbers(firstNum: -1, secondNum: 1), randomNumbers(firstNum: -0.5, secondNum: 0.5), randomNumbers(firstNum: -1, secondNum: 1))
        jfNode?.name = "Covid"
        self.sceneView.scene.rootNode.addChildNode(jfNode!)
    }
    
    func animateNode(node: SCNNode)
    {
        let spin = CABasicAnimation(keyPath: "position")
        spin.fromValue = node.presentation.position
        spin.toValue = SCNVector3(node.presentation.position.x - 0.2, node.presentation.position.y - 0.2, node.presentation.position.z - 0.2)
        spin.duration = 0.1
        spin.autoreverses = true
        spin.repeatCount = 4
        node.addAnimation(spin, forKey: "position")
    }
    
    func reiniciarTiempo(fin: Bool = false)
    {
        self.cuenta = 20
        if fin == false
        {
            self.tiempoLB.text = String(self.cuenta)
        } else
        {
            self.tiempoLB.text = "Try Again!!"
        }
    }

    var scoreCount = 0
    @IBOutlet var scoreLB: UILabel!
        
    @objc func handleTap(sender: UITapGestureRecognizer)
    {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        
        if hitTest.isEmpty
        {
        } else
        {
            if cuenta > 0
            {
                let results = hitTest.first!
                let node = results.node
                scoreCount += 1
                scoreLB.text = "Score: \(scoreCount)"
            
                if node.animationKeys.isEmpty
                {
                    SCNTransaction.begin()
                    self.animateNode(node: node)
                    SCNTransaction.completionBlock =
                    {
                        node.removeFromParentNode()
                        self.addNode()
                        self.reiniciarTiempo()
                    }
                    SCNTransaction.commit()
                }
            }
        }
    }

    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}
