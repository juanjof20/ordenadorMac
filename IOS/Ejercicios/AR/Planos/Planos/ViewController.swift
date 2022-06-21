//
//  ViewController.swift
//  Planos
//
//  Created by A1-IMAC08 on 10/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate
{
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.sceneView.delegate = self
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
    }
    
//    func createLava() -> SCNNode
//    {
//        let lavaNode = SCNNode(geometry: SCNPlane(width: 1, height: 1))
//        lavaNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "lava")
//        lavaNode.geometry?.firstMaterial?.isDoubleSided = true
//        lavaNode.position = SCNVector3(0, 0, -1)
//        lavaNode.eulerAngles = SCNVector3(90.degreesToRadians, 0, 0)
//        return lavaNode
//    }
    
    func createLava(planeAnchor: ARPlaneAnchor) -> SCNNode
    {
        let lavaNode = SCNNode(geometry: SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z)))
        lavaNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "lava")
        lavaNode.geometry?.firstMaterial?.isDoubleSided = true
        lavaNode.position = SCNVector3(planeAnchor.center.x, planeAnchor.center.y, planeAnchor.center.z)
        lavaNode.eulerAngles = SCNVector3(90.degreesToRadians, 0, 0)
        return lavaNode
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor)
    {
        guard let planeAnachor = anchor as? ARPlaneAnchor else { return }
        let lavaNode = createLava(planeAnchor: planeAnachor)
        node.addChildNode(lavaNode)
        print("Crear plane anchor")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
    {
        guard let planeAnachor = anchor as? ARPlaneAnchor else { return }
        node.enumerateChildNodes // Si comento estas 3 lineas se queda mas guapo pero estaria mal hecho
        { (childNodes, _) in
            childNodes.removeFromParentNode()
        }
                let lavaNode = createLava(planeAnchor: planeAnachor)
                node.addChildNode(lavaNode)
        print("Actualizar plane anchor")
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didRemove node: SCNNode, for anchor: ARAnchor)
    {
        node.enumerateChildNodes
        { (childNodes, _) in
            childNodes.removeFromParentNode()
        }
        print("Eliminando plane anchor")
    }
}

extension Int
{
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

