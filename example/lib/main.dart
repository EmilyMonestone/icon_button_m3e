import 'package:flutter/material.dart';
import 'package:icon_button_m3e/icon_button_m3e.dart';

void main() => runApp(const DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IconButtonM3E Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        extensions: const [IconButtonM3ETokens.fallback()],
      ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    const sizes = IconButtonM3ESize.values;
    const variants = IconButtonM3EVariant.values;

    return Scaffold(
      appBar: AppBar(title: const Text('IconButtonM3E Demo')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Toggle example',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              IconButtonM3E(
                variant: IconButtonM3EVariant.tonal,
                isSelected: selected,
                icon: const Icon(Icons.favorite_border),
                selectedIcon: const Icon(Icons.favorite),
                tooltip: selected ? 'Unfavorite' : 'Favorite',
                onPressed: () => setState(() => selected = !selected),
              ),
              IconButtonM3E(
                variant: IconButtonM3EVariant.filled,
                isSelected: selected,
                icon: const Icon(Icons.bookmark_add_outlined),
                selectedIcon: const Icon(Icons.bookmark_added),
                tooltip: selected ? 'Remove bookmark' : 'Add bookmark',
                onPressed: () => setState(() => selected = !selected),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Variants × Sizes (round)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          for (final v in variants) ...[
            Text(v.toString().split('.').last.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final s in sizes)
                  IconButtonM3E(
                    variant: v,
                    size: s,
                    icon: const Icon(Icons.mic),
                    tooltip: 'Mic',
                    onPressed: () {},
                  ),
              ],
            ),
            const SizedBox(height: 16),
          ],
          const SizedBox(height: 24),
          const Text('Square shape',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final v in variants)
                IconButtonM3E(
                  variant: v,
                  shape: IconButtonM3EShape.square,
                  size: IconButtonM3ESize.m,
                  icon: const Icon(Icons.share),
                  tooltip: 'Share',
                  onPressed: () {},
                ),
            ],
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
