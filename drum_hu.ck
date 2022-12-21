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

0.5 => hihat.gain;
0.7 => hihat2.gain;


[
1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0,
1,0,0,0, 1,0,0,0, 1,0,0,0, 1,0,0,0
] @=> int kick_hits[];
[
0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0,
0,0,1,0, 0,0,1,0, 0,0,1,0, 0,0,1,0
] @=> int snare_hits[];
[
0,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1,
0,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1,
0,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1,
0,1,1,1, 1,1,1,1, 1,1,1,1, 1,1,1,1
] @=> int hihat_hits[];
[
1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
1,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0
] @=> int hihat2_hits[];

[
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en,
en,en,en,en,en,en,en,en, en,en,en,en,en,en,en,en
] @=> dur durs1[];

//beat start

for ( 0 => int i; i<kick_hits.size()-1; i++){
    if (kick_hits[i])
        0 => kick.pos;
    if (snare_hits[i])
        0 => snare.pos;
    if (hihat_hits[i])
        0 => hihat.pos;
    if(hihat2_hits[i])
        0 => hihat2.pos;
    durs1[i] => now;
}