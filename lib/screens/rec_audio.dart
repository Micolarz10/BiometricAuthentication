import 'dart:io';
import 'package:flutter/material.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/services.dart';



// ------------------------------------ record audio

class AudioRecorderUI extends StatefulWidget {
  const AudioRecorderUI({Key? key}) : super(key: key);

  @override
  _AudioRecorderUIState createState() => _AudioRecorderUIState();
}

class _AudioRecorderUIState extends State<AudioRecorderUI> {
  late final RecorderController recorderController;

  String? path;
  bool isRecording = false;

  @override
  void initState() {
    super.initState();
    _initialiseControllers();
  }

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  void _startOrStopRecording() async {
    try {
      if (isRecording) {
        recorderController.reset();

        final path = await recorderController.stop(false);

        if (path != null) {
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
        }
      } else {
        await recorderController.record(path: path);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF252331),
      appBar: AppBar(
        backgroundColor: const Color(0xFF252331),
        elevation: 1,
        centerTitle: true,
        shadowColor: Colors.grey,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text('Record Your Voice For Authentification'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isRecording
                  ? AudioWaveforms(
                      enableGesture: true,
                      size: Size(MediaQuery.of(context).size.width / 2, 50),
                      recorderController: recorderController,
                      waveStyle: const WaveStyle(
                        waveColor: Colors.white,
                        extendWaveform: true,
                        showMiddleLine: false,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF1E1B26),
                      ),
                      padding: const EdgeInsets.only(left: 18),
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                    )
                  : Container(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _startOrStopRecording,
                  icon: Icon(isRecording ? Icons.stop : Icons.mic),
                  color: Colors.white,
                  iconSize: 28,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
