BPM bpm;
bpm.tempo(100);
bpm.qn => dur qn;
bpm.dqn => dur dqn;
bpm.en => dur en;
bpm.den => dur den;
bpm.dden => dur dden;
[
0,53,57,53,55,55,53,55,  0,0,53,55,   57,57,50,53,55,0,53,55,  57,57,50,53,55,0,48,
50,53,53,57,55,53,52,57,58,   60,58,57,55,55,57,0,53,55,     55,53,53,0,53,55,       57,57,57,57,55,55,53,0,0,
0,50,48,48,50,53,  55,0,53,55,57,57,50,50,     53,50,0,50,   48,50,48,46,45,0,0,
0,53,57,55,57,55,53,55,   57,55,55,0,53,55,57,55,55,0,53,55,   57,55,55,0,53,55,57,55,55,0,48,48,  48,50,53,55,57,60,62,60
] @=> int melody_2[];
[
en,en,en+qn,den,den,den,den,en   +dqn,qn,en,den,den,    en,en,en,en+en,en,en,den,den,    en,en,en,en+en,en,en,en,
en,en,en,en+en,den,den,en,den,den,   en,en,en,den,den+en,en,en,den,den,   en,den,den+dqn,en,den,den,    den,den,en,en,den,den+den,den,en,qn,
qn,en,en,qn,en,en,   qn,en,den,den,en,en,en,en,   qn+en,qn+en,en,en,    den,den,en+en,en+den,den,en,qn,
en,en,en,den,den,en+qn,den,den,   en,den,den,en,den,den,en,den,den,en,den,den,   en,den,den,en,den,den,en,den,den,en,den,den,   en,en,en,en,en,en,en,en
] @=> dur durs_2[];

Rhodey s => dac;

for ( 0 => int i; i< melody_2.size()-1; i++){
    if(melody_2[i] == 0) {
        1 => s.noteOff;
        durs_2[i] => now;
    }
    else{    
        Std.mtof(melody_2[i]) => s.freq;
        1 => s.noteOn;
        durs_2[i]=> now;
    }
}