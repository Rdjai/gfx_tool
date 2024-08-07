import 'dart:io';

void applySettings(double resolution, String graphicsApi, double frameRate) {
  // Example: Modify configuration file (requires appropriate permissions)
  File configFile = File('/path/to/pubg/config/file');
  if (configFile.existsSync()) {
    List<String> lines = configFile.readAsLinesSync();
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].startsWith('Resolution=')) {
        lines[i] = 'Resolution=${(resolution * 100).toInt()}';
      }
      if (lines[i].startsWith('GraphicsAPI=')) {
        lines[i] = 'GraphicsAPI=$graphicsApi';
      }
      if (lines[i].startsWith('FrameRate=')) {
        lines[i] = 'FrameRate=${frameRate.toInt()}';
      }
    }
    configFile.writeAsStringSync(lines.join('\n'));
  }
}
