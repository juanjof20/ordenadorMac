//
//  ViewController.swift
//  ARDrawing
//
//  Created by A1-IMAC08 on 9/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate
{
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    @IBOutlet var dibujarBT: UIButton!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.sceneView.debugOptions = [ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.showsStatistics  = true
        self.sceneView.session.run(configuration)
        self.sceneView.delegate = self
    }

    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval)
    {
//        print("renderizando...")
        // Dibujar delante de la camara
        guard let pointOfView = sceneView.pointOfView else {return}
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33) /// La orientacion seimpre esta codificada en la tercera columna de la matriz transform
        let location = SCNVector3(transform.m41, transform.m42, transform.m43) /// La ubicacion del eje X esta en la 4º columna de la matriz transformada
        let frontOfCamera = orientation + location
//        print(orientation.x, orientation.y, orientation.z)
        
        DispatchQueue.main.async
        {
            if self.dibujarBT.isHighlighted // Si esta pulsado
            {
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.01))
                
                sphereNode.position = frontOfCamera
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.white
                self.sceneView.scene.rootNode.addChildNode(sphereNode)
                print("Se esta dibujando")
            } else
            {
                let pointer = SCNNode(geometry: SCNSphere(radius: 0.005))
//                let pointer = SCNNode(geometry: SCNBox(width: 0.01, height: 0.01, length: 0.01, chamferRadius: 0.005))
                self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
//                    node.removeFromParentNode()
//                    if node.geometry is SCNBox
//                    {
//                        node.removeFromParentNode()
//                    }
                    if node.name == "pointer"
                    {
                        node.removeFromParentNode()
                    }
                })
                pointer.name = "pointer"
                pointer.position = frontOfCamera
                pointer.geometry?.firstMaterial?.diffuse.contents = UIColor.green
                self.sceneView.scene.rootNode.addChildNode(pointer)
                print("Se esta dibujando")
            }
        }
    }


}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3
{
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
