//
//  ViewController.swift
//  ARKIT3D
//
//  Created by A1-IMAC08 on 10/2/22.
//

import UIKit
import ARKit

class ViewController: UIViewController,ARSCNViewDelegate
{
    @IBOutlet var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.sceneView.session.run(configuration)
    }
    
    //Esfera Azul
    @IBAction func esferaBT(_ sender: Any)
    {
        let node = SCNNode()
        node.geometry = SCNSphere(radius: 0.05)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.blue
        node.position = SCNVector3(x: 0, y: 0, z: 0)
        self.sceneView.scene.rootNode.addChildNode(node)
        self.sceneView.delegate = self
    }
    
    //Casa
    @IBAction func CasaBT(_ sender: Any)
    {
        //Cubo
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.2, height: 0.2, length: 0.2, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        node.position = SCNVector3(0, 0, -1) // cambiar z: -1 despues de hacer las pruebas
        self.sceneView.scene.rootNode.addChildNode(node)
        
        //Tejado
        let nodeP = SCNNode()
        nodeP.geometry = SCNPyramid(width: 0.2, height: 0.1, length: 0.2)
        nodeP.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "tejas")
        nodeP.position = SCNVector3(0,0.1,0)
        node.addChildNode(nodeP)
        
        //Puerta
        let nodePuerta = SCNNode()
        nodePuerta.geometry = SCNPlane(width: 0.05, height: 0.08)
        nodePuerta.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "puerta")
        nodePuerta.position = SCNVector3(0,-0.06,0.1001)
        node.addChildNode(nodePuerta)
        
        //Ventanas
        let nodeVentana = SCNNode()
        nodeVentana.geometry = SCNPlane(width: 0.06, height: 0.06)
        nodeVentana.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "ventana")
        nodeVentana.position = SCNVector3(-0.05,0.06,0.1001)
        node.addChildNode(nodeVentana)
        let nodeVentana2 = SCNNode()
        nodeVentana2.geometry = SCNPlane(width: 0.06, height: 0.06)
        nodeVentana2.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "ventana")
        nodeVentana2.position = SCNVector3(0.05,0.06,0.1001)
        node.addChildNode(nodeVentana2)
        
        //Jardin
        let nodeJ = SCNNode()
        nodeJ.geometry = SCNPlane(width: 1, height: 1)
        nodeJ.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "cesped")
        nodeJ.position = SCNVector3(0,-0.1,0.2)
        nodeJ.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0)
        nodeJ.geometry?.firstMaterial?.isDoubleSided = true
        node.addChildNode(nodeJ)
        
        //Pozo
        let nodePozo = SCNNode()
        nodePozo.geometry = SCNTube(innerRadius: 0.015, outerRadius: 0.025, height: 0.07)
        nodePozo.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "pozo")
        nodePozo.position = SCNVector3(0.25,-0.1,0.2)
        node.addChildNode(nodePozo)
        
        //Piscina
        let nodePiscina = SCNNode()
        nodePiscina.geometry = SCNBox(width: 0.15, height: 0.05, length: 0.2, chamferRadius: 0)
        nodePiscina.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "piscina")
        nodePiscina.position = SCNVector3(0, -0.1, 0.25)
        node.addChildNode(nodePiscina)
        
        //Agua Piscina
        let nodeAgua = SCNNode()
        nodeAgua.geometry = SCNPlane(width: 0.12, height: 0.17)
        nodeAgua.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "agua")
        nodeAgua.position = SCNVector3(0, 0.026, 0)
        nodeAgua.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0)
        nodeAgua.geometry?.firstMaterial?.isDoubleSided = true
        nodePiscina.addChildNode(nodeAgua)
        
        //Flotador
        let nodeFlot = SCNNode()
        nodeFlot.geometry = SCNTorus(ringRadius: 0.02, pipeRadius: 0.005)
        nodeFlot.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        nodeFlot.geometry?.firstMaterial?.specular.contents = UIColor.white
        nodeFlot.eulerAngles = SCNVector3(Float(90.degreesToRadians), 0, 0)
        nodeFlot.position = SCNVector3(0, 0, 0)
        nodeAgua.addChildNode(nodeFlot)
        
        //Arbol Tipo 1
            //tronco
        let nodeTronco1 = SCNNode()
        nodeTronco1.geometry = SCNTube(innerRadius: 0.001, outerRadius: 0.003, height: 0.1)
        nodeTronco1.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "tronco")
        nodeTronco1.position = SCNVector3(0.3, -0.05, 0)
        node.addChildNode(nodeTronco1)
            //hojas
        let nodeHojas1 = SCNNode()
        nodeHojas1.geometry = SCNSphere(radius: 0.03)
        nodeHojas1.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "hojas")
        nodeHojas1.position = SCNVector3(0, 0.03, 0)
        nodeTronco1.addChildNode(nodeHojas1)
        
        //Arbol Tipo 2
            //tronco
        let nodeTronco2 = SCNNode()
        nodeTronco2.geometry = SCNTube(innerRadius: 0.001, outerRadius: 0.02, height: 0.3)
        nodeTronco2.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "tronco")
        nodeTronco2.position = SCNVector3(-0.3, -0.05, 0)
        node.addChildNode(nodeTronco2)
            //hojas
        let nodeHojas2 = SCNNode()
        nodeHojas2.geometry = SCNCone(topRadius: 0, bottomRadius: 0.1, height: 0.2)
        nodeHojas2.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "hojas")
        nodeHojas2.position = SCNVector3(0, 0.1, 0)
        nodeTronco2.addChildNode(nodeHojas2)
    }
    
    //Puntero Verde
    @IBOutlet var punteroBT: UIButton!
    func renderer(_ renderer: SCNSceneRenderer, willRenderScene scene: SCNScene, atTime time: TimeInterval)
    {
        guard let pointOfView = sceneView.pointOfView else {return}
        let transform = pointOfView.transform
        let orientation = SCNVector3(-transform.m31, -transform.m32, -transform.m33)
        let location = SCNVector3(transform.m41, transform.m42, transform.m43)
        let frontOfCamera = orientation + location
        
        DispatchQueue.main.async
        {
            if self.punteroBT.isHighlighted
            {
                let sphereNode = SCNNode(geometry: SCNSphere(radius: 0.01))
                sphereNode.position = frontOfCamera
                sphereNode.geometry?.firstMaterial?.diffuse.contents = UIColor.green
                self.sceneView.scene.rootNode.addChildNode(sphereNode)
                print("Se esta dibujando")
            } else
            {
                let pointer = SCNNode(geometry: SCNSphere(radius: 0.005))

                self.sceneView.scene.rootNode.enumerateChildNodes({ (node, _) in
                    if node.name == "pointer"
                    {
                        node.removeFromParentNode()
                    }
                })
                pointer.name = "pointer"
                pointer.position = frontOfCamera
                pointer.geometry?.firstMaterial?.diffuse.contents = UIColor.white
                self.sceneView.scene.rootNode.addChildNode(pointer)
            }
        }
    }

    // Borrar todo
    @IBAction func deleteBT(_ sender: Any)
    {
        self.restartSession()
    }
    
    func restartSession()
    {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes
        {(node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.removeExistingAnchors, .resetTracking])
    }
    
    //Generar numero aleatorio
    func randomNumbers(firstNum: CGFloat, secondNum: CGFloat) -> CGFloat
    {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(firstNum - secondNum) + min(firstNum, secondNum)
    }
}

//Convertir de grados a radianes
extension Int
{
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}

func +(left: SCNVector3, right: SCNVector3) -> SCNVector3
{
    return SCNVector3Make(left.x + right.x, left.y + right.y, left.z + right.z)
}
