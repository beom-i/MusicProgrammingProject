BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;


SndBuf kick => dac;
SndBuf snare => dac;
SndBuf hihat => dac;
SndBuf hihat2 => dac;
SndBuf cowbell => dac;
SndBuf claps => dac;

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;
me.dir() + "/audio/clap_01.wav" => claps.read;
me.dir() + "/audio/hihat_04.wav" => hihat2.read;
me.dir() + "/audio/cowbell_01.wav" => cowbell.read;

1.2 => claps.gain;

[
0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
0,1,0,1, 0,1,0,1, 0,1,0,1, 0,1,0,1,
0,1,0,1, 0,1,0,1, 0,1,0,1, 0,1,0,1
] @=> int claps_hits[];

[
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn,
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn,
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn,
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn
] @=> dur durs[];

//1절
for ( 0 => int i; i < claps_hits.size()-1; i++){
    if (claps_hits[i]) 
        0 => claps.pos;
    durs[i] => now;
}