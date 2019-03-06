execute:
	nasm -f elf32 -g -o ./bin/TTT_A2.o TTT_A2.asm
	ld -m elf_i386 -s -o ./bin/TTT_A2 ./bin/TTT_A2.o
	./bin/TTT_A2

experiment:
	nasm -f elf32 -g -o ./bin/Experiment.o Experiment.asm
	ld -m elf_i386 -s -o ./bin/Experiment ./bin/Experiment.o
	./bin/Experiment

clean:
	rm -r ./bin/*
