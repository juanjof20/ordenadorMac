//
//  ViewController.m
//  TableViewEX
//
//  Created by A1-IMAC08 on 4/11/21.
//

#import "ViewController.h"
#import "ViewControllerValues.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [_tabla reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _arrayModulo =
    @[
        @{@"imagen":@"accesoDatos", @"titulo":@"Módulo 1: entornos de desarrollo para videojuegos multiplataforma",@"num":@"1",@"descrip":@"Este modulo profesional es el resultado de la adaptación curricular de es[tech] para la creación de una asignatura que dote al alumno de los conocimientos necesarios para el desarrollo de juegos multiplataforma. es[tech] pone a disposición del Alumno su dilatada experiencia y conocimiento tanto a nivel creativo, como técnico para crear un perfil profesional capaz de desarrollar cualquier tipo de reto en la industria del videojuego."},
        @{@"imagen":@"unity", @"titulo":@"Módulo 2: programación en Java para Android",@"num":@"2",@"descrip":@"Este modulo profesional dota al alumno con los conocimientos básicos de programación orientada a objetos necesarios en el resto de los módulos. En la adaptación curricular es[tech] focalizamos el estudio en el lenguaje de programación Java y en el desarrollo de Apps para Android."},
        @{@"imagen":@"unity", @"titulo":@"Módulo 3: lenguajes de marcas y sistemas de gestión de información",@"num":@"3",@"descrip":@"Este módulo dota al alumno con los conocimientos necesarios para el desarrollo de aplicaciones Web tanto para la gestión de datos como para la creación de sitios web completos mediante el uso de tecnologías comerciales."},
        @{@"imagen":@"basesdatos", @"titulo":@"Módulo 4: sistemas informáticos y hardware abierto",@"num":@"4",@"descrip":@"Este módulo profesional contiene la formación necesaria para desempeñar la función de explotación de sistemas informáticos así como la integración y desarrollo de sistemas basados en Arduino y Raspberry Pi."},
        @{@"imagen":@"einem", @"titulo":@"Módulo 5: bases de datos",@"num":@"5",@"descrip":@"Este módulo profesional contiene la formación necesaria para desempeñar la función analista y programador de bases de datos, en este modulo se analizan las principales bases de datos comerciales."},
        @{@"imagen":@"fct", @"titulo":@"Módulo 6: formación y orientación laboral app",@"num":@"6",@"descrip":@"Este módulo profesional contiene la formación necesaria para que el alumno pueda insertarse laboralmente y desarrollar su carrera profesional en el sector de la Desarrollo de aplicaciones multiplataforma."},
        @{@"imagen":@"fol", @"titulo":@"Módulo 7: empresa e iniciativa emprendedora-app",@"num":@"7",@"descrip":@"Este modulo profesional contiene la formación necesaria para desarrollar la propia iniciativa en el ámbito empresarial, focalizándose en el autoempleo y en la creación de valor y riqueza a través de la sociedad del conocimiento."},
        @{@"imagen":@"ingles", @"titulo":@"Módulo 8: programación multimedia para terminales iOs",@"num":@"8",@"descrip":@"Este modulo profesional estudia en profundidad la creación de aplicaciones para terminales iPhone y iPad, uno de los perfiles profesionales mas demandados y mejor remunerados del sector del desarrollo de las TICs. El alumno será capaz de crear desde cero una aplicación en código nativo y aprenderá todas los conceptos necesarios para su puesta en producción."},
        @{@"imagen":@"interfaces", @"titulo":@"Módulo 9: desarrollo de interfaces",@"num":@"9",@"descrip":@"Este módulo profesional capacita al alumno para poder analizar, diseñar y crear interfaces de usuario para la gran variedad de dispositivos comerciales existentes teniendo en cuenta los pilares básicos de comunicación y usabilidad en todo el desarrollo. Se centra en la creación del perfil profesional analista de UX."},
        @{@"imagen":@"java", @"titulo":@"Módulo 10: programación de servicios y procesos",@"num":@"10",@"descrip":@"Este módulo profesional dota al alumno con los conocimientos necesarios para poder crear sistemas centrales de información con tecnologías de servidor. Este es uno de los elementos mas demandados a día de hoy en el sector de las TIC puesto que es el elemento que nutre de información a las Apps."},
        @{@"imagen":@"progiOs", @"titulo":@"Módulo 11: sistemas de gestión empresarial",@"num":@"11",@"descrip":@"Este módulo profesional contiene la formación necesaria para desempeñar la función de implantación y adaptación de sistemas de planificación de recursos empresariales y de gestión de relaciones con clientes."},
        @{@"imagen":@"progServicios", @"titulo":@"Módulo 12: acceso a datos",@"num":@"12",@"descrip":@"Este módulo profesional dota al alumno con los conocimientos necesarios para entender, establecer y crear comunicaciones entre diferentes tipos de terminales, se estudian los mecanismos, protocolos y metodologías que hacen posible la transferencia de información entre aplicaciones y servidores."},
        @{@"imagen":@"proyecto", @"titulo":@"Módulo 13: inglés técnico app",@"num":@"13",@"descrip":@"Este modulo profesional es el resultado de la adaptación curricular de es[tech] para la creación de una asignatura que dote al alumno de los conocimientos necesarios para la creación de los elementos gráficos 2D y 3D necesarios para la creación de Videojuegos Comerciales."},
        @{@"imagen":@"sistemas", @"titulo":@"Módulo 14: proyecto de desarrollo de aplicaciones multiplataforma",@"num":@"14",@"descrip":@"Este modulo es el resultado final del esfuerzo de nuestros alumnos. es[tech] pone a disposición de los mismos nuestras instalaciones y espacios de coworking para que puedan desarrollar su proyecto personal avalados y tutorizados por profesionales de la materia. Concluyendo con su exposición ante un tribunal que evaluara tanto la ejecución técnica como la viabilidad comercial de dicho proyecto."},
        @{@"imagen":@"sistemasGestion", @"titulo":@"Módulo 15: formación en centros de trabajo app",@"num":@"15",@"descrip":@"Este módulo profesional contribuye a completar las competencias, propias de este título, que se han alcanzado en el centro educativo o a desarrollar competencias características difíciles de conseguir en el mismo."}
    ];
}

// Numero de secciopnes
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

// Numero de rows
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayModulo.count;
}

// Tipo de celda (prototipo) y dentro le ha añadido el texto dinamico
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    miCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cIndividual"];
    NSUserDefaults *userDefaults= [NSUserDefaults standardUserDefaults];

    cell.numeroLabel.text = _arrayModulo[indexPath.row][@"num"];
    cell.tituloLabel.text = _arrayModulo[indexPath.row][@"titulo"];
    cell.imageMODULO.image = [UIImage imageNamed:_arrayModulo[indexPath.row][@"imagen"]];

    return cell;
}

// Esta funcion es para el tamaño de la celda
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 120;
    }else
    {
        return 60;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

    ViewControllerValues * segundoViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"segundaPantalla"];
    miCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cIndividual"];
    cell.tituloLabel.text=_arrayModulo[indexPath.row][@"titulo"];
    cell.imageMODULO.image = [UIImage imageNamed:_arrayModulo[indexPath.row][@"imagen"]];
    
    segundoViewController.titulo = cell.tituloLabel.text;
    segundoViewController.descri = _arrayModulo[indexPath.row][@"descrip"];
    segundoViewController.imagenCog = _arrayModulo[indexPath.row][@"imagen"];
    segundoViewController.cantCeldas = _arrayModulo[indexPath.row][@"numero"];
  
    //segundoViewController.modalPresentationStyle = UIModalPresentationFullScreen; //no pongo full screen para ahorrar el boton atras
    [self presentViewController:segundoViewController animated:YES completion:nil];
}

@end
