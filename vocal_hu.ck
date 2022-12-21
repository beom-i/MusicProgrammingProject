BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;

[
67,67,62,62,65,65,65,62,60,60, 67,67,62,62,65,65,65,65,65,62,   
67,67,62,62,65,65,65,62,60,0,  67,67,62,62,65,65,67,
67,67,62,62,65,65,65,62,60,60, 67,67,62,62,65,65,65,65,65,62,   
67,67,62,62,65,65,65,62,60,0,  67,67,62,62,65,65,67
] @=> int melody_hu[];

[
en,en,den,den,en,en,en,den,en,den,  en,en,den,den,den,den,den,den,en,qn,
en,en,den,den,en,en,en,den,den,en,  en,en,den,den,en,en,qn+en,
en,en,den,den,en,en,en,den,en,den,  den,den,en,den,den,en,den,den,en,qn,
en,en,den,den,en,en,en,den,den,en,  en,en,den,den,en,en,qn+en+qn
]@=> dur durs_hu[];
Rhodey s => dac;

for ( 0 => int i; i< melody_hu.size()-1; i++){
    if(melody_hu[i] == 0) {
        1 => s.noteOff;
        durs_hu[i] => now;
    }
    else{    
        Std.mtof(melody_hu[i]) => s.freq;
        1 => s.noteOn;
        durs_hu[i]=> now;
    }
}
