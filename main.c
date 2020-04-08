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
void goToStartState();
void goToInstructionState();
void goToGameState();
void goToPauseState();
void goToLoseState();

// States
enum {START, INSTRUCTION, GAME, PAUSE, LOSE};
int state;

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

// Sets up GBA
void initialize() {
    goToStartState();
}

void startState() {

    // Lock the framerate to 60 fps
    waitForVBlank();

    // Press START to go to the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        // initGame();
        goToGameState();
    }

    // Press SELECT to go to the instructions
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstructionState();
    }
}

void goToStartState() {

    waitForVBlank();

    // Loads the background for the start screen
    DMANow(3, startScreenPal, PALETTE, 256);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;
}

void instructionState() {
    waitForVBlank();

    // Press START to go to the game
    if (BUTTON_PRESSED(BUTTON_START)) {
        // initGame();
        goToGameState();

    }

    // Press SELECT to go to the start screen
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStartState();
    }
}

void goToInstructionState() {
    waitForVBlank();

    DMANow(3, instructionScreenPal, PALETTE, 256);
    DMANow(3, instructionScreenTiles, &CHARBLOCK[0], instructionScreenTilesLen/2);
    DMANow(3, instructionScreenMap, &SCREENBLOCK[31], instructionScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = INSTRUCTION;
}

void gameState() {
    waitForVBlank();

    // goes to the pause screen when START is pressed
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPauseState();
    }

}

void goToGameState() {

    // Sets up and shows background
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_TALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(30);

    // Loads in the background for the game screen
    DMANow(3, gameScreenPal, PALETTE, 256);
    DMANow(3, gameScreenTiles, &CHARBLOCK[0], gameScreenTilesLen/2);
    DMANow(3, gameScreenMap, &SCREENBLOCK[30], gameScreenMapLen/2);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = GAME;
}

void pauseState() {

    waitForVBlank();

    // resume the game by pressing START
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGameState();
    }

    // restarts the game by pressing SELECT
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStartState();
    }
}

void goToPauseState() {

    waitForVBlank();

    DMANow(3, pauseScreenPal, PALETTE, 256);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[31], pauseScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);
    REG_BG1CNT = BG_SIZE_SMALL | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = PAUSE;
}

void loseState() {

    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToStartState();
    }
}

void goToLoseState() {

    waitForVBlank();

    DMANow(3, loseScreenPal, PALETTE, 256);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen/2);

    // Sets up and shows the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31);

    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;
}

