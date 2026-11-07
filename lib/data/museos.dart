import 'package:parcial_flutter/models/museo.dart';

const museos = <Museo>[
  Museo(
    id: 'arte-del-rio',
    nombre: 'Museo de Arte del Río',
    descripcion: 'Colección de pintura y escultura moderna, con salas dedicadas al arte del siglo XX y a exposiciones temporales.',
    ubicacion: 'Calle 10, Centro',
    imagenAsset: 'assets/museos/arte_rio.jpg',
  ),
  Museo(
    id: 'historia-natural-andina',
    nombre: 'Museo de Historia Natural Andina',
    descripcion: 'Exposiciones de fauna, flora y geología de la región andina, organizadas para consulta del público y de investigadores.',
    ubicacion: 'Carrera 7, Centro',
    imagenAsset: 'assets/museos/historia_andina.jpg',
  ),
  Museo(
    id: 'arqueologico-altiplano',
    nombre: 'Museo Arqueológico del Altiplano',
    descripcion: 'Piezas arqueológicas de distintas culturas y épocas que conservan el patrimonio de los pueblos del altiplano.',
    ubicacion: 'Plaza del Altiplano, Centro',
    imagenAsset: 'assets/museos/arqueologico_altiplano.jpg',
  ),
  Museo(
    id: 'patrimonio-local',
    nombre: 'Casa Museo del Patrimonio Local',
    descripcion: 'Casa histórica que conserva objetos, documentos y fotografías de la vida cotidiana de la comunidad.',
    ubicacion: 'Calle de la Cultura, Centro',
    imagenAsset: 'assets/museos/patrimonio_local.jpg',
  ),
];
