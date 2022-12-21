BPM bpm;
bpm.tempo(100);

bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;
[
55,0,0,0,55,  0,0,55,0    ,53,0,0,0,53,  0,56,0,
55,0,0,0,55,  0,0,55      ,53,0,0,0,53,  0,56,0
]@=> int chord_hu_1[];

[
52,0,0,0,51,  0,0,52,0,    50,0,0,0,51,  0,63,61,
52,0,0,0,51,  0,0,52,      50,0,0,0,51,  0,63,61
]@=> int chord_hu_2[];

[
qn,en,qn,qn,en +en,   en,qn,qn+en,en,    qn,en,qn,qn,en +qn,    qn,qn,qn,
qn,en,qn,qn,en +en,   en,qn,qn+qn,       qn,en,qn,qn,en +qn,    qn,qn,qn
] @=> dur durs_hu[];

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


for ( 0 => int i; i < chord_hu_1.size()-1; i++){
    if(chord_hu_1[i] ==0){
        1 => s1.noteOff;
    }
    if(chord_hu_2[i] == 0){
        1 => s2.noteOff;
    }
    setChordOn(chord_hu_1[i],chord_hu_2[i]);
    durs_hu[i]=> now;
    setChordOff();
}
