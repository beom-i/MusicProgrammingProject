BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;


[
0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,0,
0,0,0,0, 0,0,0,0, 0,0,0,0, 0,0,0,53,55,
57,60,60,60,62,65,65,  67,69,0,0,0,65,67, 69,67,65,62,65,67,65,65, 0,0,0,57,58,
57,60,60,60,62,65,65,72 ,70,69, 67,0,65,67,  69,65,65,62,65,67,65,  69,65,65,62,65,67,65
] @=> int melody_1[];

[
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn,
qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,qn, qn,qn,qn,en,en,

en,en,en,en,en,en,en,en +en,en,qn,qn,en,den,den, en,en,en,en,en,en,en,en + qn,qn,qn,en,den,den, 

en,en,en,en,en,en,en,en +en, en,qn+en, en,en,den,den, en,en,en,en,en,en,qn, en,en,en,en,en,en,qn
] @=> dur durs_1[];


Rhodey s => dac;

for ( 0 => int i; i< melody_1.size()-1; i++){
    if(melody_1[i] == 0) {
        1 => s.noteOff;
        durs_1[i] => now;
    }
    else{    
        Std.mtof(melody_1[i]) => s.freq;
        1 => s.noteOn;
        durs_1[i] => now;
    }
}
