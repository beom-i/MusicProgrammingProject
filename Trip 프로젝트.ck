public class BPM{
    dur dqn;
    dur qn; // 1
    dur en; // 1/2
    dur den; // 1/4
    dur dden; // 1/8
    fun void tempo(float beat) { // beat in BPM
        60.0 / beat => float spb; // seconds per beat  
        spb::second => qn;
        qn * 2 => dqn;
        qn / 2.0 => en;
        qn / 4.0 => den;
        qn / 8.0 => dden;
    }
}


BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;
    
[
57,60,62,60, 62 ,62  ,53,58,60,58,   60,  63,61,
57,60,62,60, 62 ,62  ,53,58,60,58,   60,  63,61,
57,60,62,60, 62 ,62  ,53,58,60,58,   60,  63,61,
57,60,62,60, 62,  51,53,55,55,48, 53,58,60,58,60  ,63,61
] @=> int melody_1[];

[
qn,en,qn,qn,en  +dqn,dqn  ,qn,en,en+en,qn,en  +dqn, qn,qn,
qn,en,qn,qn,en  +dqn,dqn  ,qn,en,en+en,qn,en  +dqn, qn,qn,
qn,en,qn,qn,en  +dqn,dqn  ,qn,en,en+en,qn,en  +dqn, qn,qn,
qn,en,qn,qn,en  +dqn, den,den,en,en,en, qn,en,en+en,qn, en+dqn , qn,qn
] @=> dur durs_1[];

[
57,60,62,60,62, 51,55,62,52  ,57,58,60,58,60, 49, 63, 61,
57,60,62,60,62, 51,55,62,     57,58,60,58,60, 49, 63, 61
] @=> int melody_hu[];

[
qn,en,qn,qn,en +en,en,qn,qn+en,en,  qn,en,qn,qn,en +qn,qn,qn,qn,
qn,en,qn,qn,en +en,en,qn,qn+qn,     qn,en,qn,qn,en +qn,qn,qn,qn
]@=> dur durs_hu[];
//흠~ + 잠깐
[
57,60,62,60,62,     51,55,62,52,55,    53,58,60,58,60,    51,53,63,52,61,
57,60,62,60,62,    62,52,53,55,55,48,   53,58,60,58,60,    49,53,63,61,
57,60,67,  65,    65,62,60,    59,57,
45,48,53,55,60,   58,57,55,   57,62,65,53,    70,69,67,65
] @=> int melody_2[];

[
qn,en,en+en,qn,en+qn,  en,en,en,en,qn,  qn,en,en+en,qn,en+qn,   en,en,en,en,qn,
qn,en,en+en,qn,en,    dqn,den,den,en,en,en,  qn,en,en+en,qn,en+qn,  en,en,qn,qn,
dqn+en,qn,en+dqn+qn,qn,   dqn+en,qn,en+dqn,qn,qn,
en,en+qn,en,qn,en+en,en,dqn,qn,   dqn,qn,en,en+dqn,  en,en,en,en
] @=> dur durs_2[];


Mandolin s  => dac;
Machine.add(me.dir()+"/vocal_1.ck") => int vocal_1;
Machine.add(me.dir()+"/drum_1.ck") => int drum_1;
Machine.add(me.dir()+"/chord_1.ck") => int chord_1;

for ( 0=> int i; i<melody_1.size()-1; i++){
    Std.mtof(melody_1[i]) => s.freq;
    1=>s.noteOn;
    durs_1[i]=> now;
    1=>s.noteOff;  
}
Machine.remove(vocal_1);
Machine.remove(chord_1);
Machine.remove(drum_1);
Machine.add(me.dir()+"/chord_hu.ck") => int chord_hu;
Machine.add(me.dir()+"/vocal_hu.ck") => int vocal_hu;
Machine.add(me.dir()+"/drum_hu.ck") => int drum_hu;
for ( 0=> int i; i<melody_hu.size()-1; i++){
    Std.mtof(melody_hu[i]) => s.freq;
    1=>s.noteOn;
    durs_hu[i]=> now;
    1=>s.noteOff;  
}
Machine.remove(vocal_hu);
Machine.remove(chord_hu);
Machine.remove(drum_hu);
Machine.add(me.dir()+"/chord_2.ck") => int chord_2;
Machine.add(me.dir()+"/vocal_2.ck") => int vocal_2;

for ( 0=> int i; i<melody_2.size()-1; i++){
    Std.mtof(melody_2[i]) => s.freq;
    1=>s.noteOn;
    durs_2[i]=> now;
    1=>s.noteOff;   
}
for( 0=> int i ; i<2;i++){
    Machine.remove(vocal_2);
    Machine.remove(chord_2);
    Machine.remove(vocal_hu);
    Machine.remove(chord_hu);
    Machine.remove(drum_hu);
    Machine.add(me.dir()+"/chord_hu.ck") => int chord_hu;
    Machine.add(me.dir()+"/vocal_hu.ck") => int vocal_hu;
    Machine.add(me.dir()+"/drum_hu.ck") => int drum_hu;
    for ( 0=> int i; i<melody_hu.size()-1; i++){
        Std.mtof(melody_hu[i]) => s.freq;
        1=>s.noteOn;
        durs_hu[i]=> now;
        1=>s.noteOff;  
    }
}