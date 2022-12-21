BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;
[
55,0,0,0,55,   0,0,55,0,0,    50,0,0,0,53,  0,0,56,0,0,
55,0,0,0,55,   55,0,0,0,52,0, 50,0,0,0,53,  0,0,56,0,
55,0,63,0,     62,0,53,53,53,
0,0,48,0,58,0,0,0,  48,0,0,0,   58,57,55,53
]@=> int chord2_1[];
[
52,0,0,0,51,  0,0,52,0,0,    0,0,0,0,49,   0,0,52,0,0,
52,0,0,0,51,  51,0,0,0,0,0,  0,0,0,0,49,   0,0,52,0,
0,0,58,0,     57,0,51,51,48,
0,0,45,0,55,0,0,0,   0,0,0,0,   0,0,0,0
] @=> int chord2_2[];

[
qn,en,en+en,qn,en+qn,   en,en,en,en,qn,        qn,en,en+en,qn,en+qn,  en,en,en,en,qn,
qn,en,en+en,qn,en,      dqn,den,den,en,en,en,  qn,en,en+en,qn,en+qn,  en,en,qn,qn,
dqn+en,qn,en+dqn+qn,qn,   dqn+en,qn,en+dqn,qn,qn,
en,en+qn,en,qn,en+en,en,dqn,qn,   dqn,qn,en,en+dqn,  en,en,en,en
] @=> dur durs_2[];

Mandolin s1 => dac;
Mandolin s2 => dac;

fun void setChordOn(int chord1, int chord2) {
    if(chord1 != 0 && chord2 !=0){
        Std.mtof(chord1) => s1.freq;
        Std.mtof(chord2) => s2.freq;
        1 => s1.noteOn;
        1 => s2.noteOn;
    }
}

fun void setChordOff(){
    1 => s1.noteOff;
    1 => s2.noteOff;
}

for ( 0 => int i; i < chord2_1.size()-1; i++){
    if(chord2_1[i] ==0){
        1 => s1.noteOff;
    }
    if(chord2_2[i] == 0){
        1 => s2.noteOff;
    }
    setChordOn(chord2_1[i],chord2_2[i]);
    durs_2[i]=> now;
    setChordOff();
}
    