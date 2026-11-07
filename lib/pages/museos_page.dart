import 'package:flutter/material.dart';
import 'package:parcial_flutter/data/museos.dart';
import 'package:parcial_flutter/models/museo.dart';
import 'package:parcial_flutter/navigation/abrir_google.dart';

const _navy = Color(0xFF102A43);
const _blue = Color(0xFF0879D1);

class MuseosPage extends StatefulWidget {
  const MuseosPage({super.key});

  @override
  State<MuseosPage> createState() => _MuseosPageState();
}

class _MuseosPageState extends State<MuseosPage> {
  String _consulta = '';

  @override
  Widget build(BuildContext context) {
    final filtrados = museos
        .where((museo) => museo.nombre.toLowerCase().contains(_consulta))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF6F8FB),
      appBar: AppBar(
        toolbarHeight: 66,
        backgroundColor: _navy,
        foregroundColor: Colors.white,
        titleSpacing: 24,
        title: Row(
          children: [
            const Icon(Icons.museum_outlined, size: 22),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                'Sistema de Administración de Museos',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        actions: [
          if (MediaQuery.sizeOf(context).width > 540)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 28),
              child: Center(
                child: Text('Museos', style: TextStyle(color: Colors.white70)),
              ),
            ),
          const SizedBox(width: 16),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 760 ? 2 : 1;
          return Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1120),
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(24, 30, 24, 22),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 18),
                              child: Text(
                                'Centro',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _navy,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Museos',
                                      style: TextStyle(
                                        color: _navy,
                                        fontSize: 32,
                                        fontWeight: FontWeight.w700,
                                        height: 1.2,
                                      ),
                                    ),
                                    SizedBox(height: 7),
                                    Text(
                                      'Directorio de museos registrados en el sistema',
                                      style: TextStyle(
                                        color: Color(0xFF6B7C8F),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                margin: const EdgeInsets.only(top: 6),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: const Color(0xFFE4EAF1),
                                  ),
                                ),
                                child: Text(
                                  '${filtrados.length} museos',
                                  style: const TextStyle(
                                    color: _navy,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 22),
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 470),
                            child: TextField(
                              onChanged: (value) => setState(
                                () => _consulta = value.trim().toLowerCase(),
                              ),
                              decoration: InputDecoration(
                                hintText: 'Buscar por nombre',
                                hintStyle: const TextStyle(
                                  color: Color(0xFF8594A5),
                                ),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xFF7B8999),
                                  size: 20,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 13,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFE5EAF0),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: _blue),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (filtrados.isEmpty)
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Text(
                          'No se encontraron museos.',
                          style: TextStyle(color: Color(0xFF6B7C8F)),
                        ),
                      ),
                    )
                  else
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                      sliver: SliverGrid.builder(
                        itemCount: filtrados.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 18,
                          mainAxisSpacing: 18,
                          mainAxisExtent: 408,
                        ),
                        itemBuilder: (context, index) => _MuseoCard(
                          museo: filtrados[index],
                          onTap: () => abrirGoogle(filtrados[index].nombre),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MuseoCard extends StatelessWidget {
  final Museo museo;
  final VoidCallback onTap;

  const _MuseoCard({required this.museo, required this.onTap});

  @override
  Widget build(BuildContext context) => Card(
    elevation: 1,
    shadowColor: const Color(0x140B2942),
    color: Colors.white,
    surfaceTintColor: Colors.white,
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(13),
      side: const BorderSide(color: Color(0xFFE9EEF3)),
    ),
    child: InkWell(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 214,
            width: double.infinity,
            child: Image.asset(
              museo.imagenAsset,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const _ImagenMuseoFallback(),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(17, 15, 17, 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    museo.nombre,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: _navy,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    museo.descripcion,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Color(0xFF718094),
                      fontSize: 13,
                      height: 1.45,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 16,
                        color: Color(0xFF6C7C8E),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        museo.ubicacion.toUpperCase(),
                        style: const TextStyle(
                          color: _navy,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 9),
                  Row(
                    children: [
                      const Text(
                        'Ver detalles',
                        style: TextStyle(
                          color: _blue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.arrow_forward, color: _blue, size: 15),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class _ImagenMuseoFallback extends StatelessWidget {
  const _ImagenMuseoFallback();

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFFE7EEF5),
    child: const Center(
      child: Icon(Icons.museum_outlined, color: _blue, size: 54),
    ),
  );
}
