#include <stdlib.h>
#include "myLib.h"

#include "startScreen.h"
#include "instructionScreen.h"
#include "gameScreen.h"
#include "pauseScreen.h"
#include "loseScreen.h"


// Prototypes
void initialize();

// State Prototypes
void startState();
void instructionState();
void gameState();
void pauseState();
void loseState();
void goToStart();
void goToInstructionState();
void goToGame();
void goToPause();
void goToLose();

// States
enum {START, INSTRUCTION, GAME, PAUSE, LOSE};
int state;
int lives = 3;

OBJ_ATTR shadowOAM[128];

// Button Variables
unsigned short buttons;
unsigned short oldButtons;

int main() {

    initialize();

    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;

        // State Machine
        switch (state) {
            case START:
            startState();
            break;

            case INSTRUCTION:
            instructionState();
            break;

            case GAME:
            gameState();
            break;

            case PAUSE:
            pauseState();
            break;

            case LOSE:
            loseState();
            break;
        }

    }
}

void initialize() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(27);
	goToStart();
}

void startState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        // initGame();
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
       goToInstructionState();
    } 
}

void goToStart() {
    REG_BG0VOFF = 0;
    REG_BG1VOFF = 0;
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    DMANow(3, startScreenPal, PALETTE, startScreenPalLen/2);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen / 2);
    DMANow(3, startScreenMap, &SCREENBLOCK[28], startScreenMapLen / 2);
    state = START;
}

void instructionState() {
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToStart();
    }
}

void goToInstructionState() {
    DMANow(3, instructionScreenPal, PALETTE, instructionScreenPalLen/2);
    DMANow(3, instructionScreenTiles, &CHARBLOCK[0], instructionScreenTilesLen / 2);
    DMANow(3, instructionScreenMap, &SCREENBLOCK[28], instructionScreenMapLen / 2);
    state = INSTRUCTION;
}

void gameState() {
   // updateGame();
    waitForVBlank();
    //drawGame();
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
}

void goToGame() {
    DMANow(3, gameScreenPal, PALETTE, gameScreenPalLen / 2);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen / 2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[28], gameScreenMapLen / 2);
    state = GAME;
} 

void pauseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    } 
}

void goToPause() {
    REG_DISPCTL = MODE0 | BG1_ENABLE | SPRITE_ENABLE;
    DMANow(3, pauseScreenPal, PALETTE, pauseScreenPalLen/2);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen / 2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[28], pauseScreenMapLen / 2);
    waitForVBlank();
    DMANow(3, shadowOAM, OAM, (4*128));
    state = PAUSE;
} 

void loseState() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}

void goToLose() {
    REG_BG0VOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, loseScreenPal, PALETTE, loseScreenPalLen/2);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen / 2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[28], loseScreenMapLen / 2);
    waitForVBlank();
    hideSprites();
    DMANow(3, shadowOAM, OAM, (4*128));
    state = LOSE;
}
