{colors, ...}: ''
  $background: #${colors.base00};
  $foreground: #${colors.base01};
  $gray: #${colors.base02};
  $color1: #${colors.base0D};
  $color2: #${colors.base09};
  $color3: #${colors.base08};
  $color4: #${colors.base0B};
  $color5: #${colors.base01};
  $color6: #${colors.base0E};
  $color7: #${colors.base0D};
  $color8: #${colors.base0C};
  $color9: #${colors.base07};
  $color10: #${colors.base02};
  $radius: 2px;
  $text: $color9;

  * {
    all: unset;
    font-family: monospace;
  }

  .bar {
    background-color: $background;
    box-shadow: 1px 2px 10px $background;
    padding: 4px;
    border-bottom: 1px solid $color1;
    //border-radius: $radius;
  }

  // Styles on classes (see eww.yuck for more information)
  .startMenu {
    padding: 0 10px;
    font-weight: 700;
    color: $text;
  }

  .clock {
    color: $color9;
  }

  .clockb {
    padding: 0 14px;
  }

  .music {
    padding: 0 20px;

    .musicLabel {
      padding: 0 5px;
    }
  }

  .circular-progress {
    color: $color9;
    background-color: $background;
    border-radius: $radius;
  }

  .net {
    color: $color7;
    padding-right: 10px;
  }

  .buttonsRight {
    margin-left: 30px;
  }

  .buttonStyle {
    background: $background;
    border-radius: $radius;
    padding: 0 8px;

    border: 1px solid $foreground;
    &:hover {
      border: 1px solid $color4;
    }
  }

  .systray {
    color: $color7;
    border-radius: $radius;

    * {
      background-color: $background;
      border-radius: $radius;
      padding: 2px;
      box-shadow: none;
      margin: 0;

      &:hover {
        color: $foreground;
      }
    }
  }

  .audio, {
    color: $color2;
    padding: 0 10px;
  }

  .rightside {
    color: $color7;
    padding: 0 10px;
  }


  .metric {
    // padding-left: 18px;
    // background: $foreground;
    border-radius: $radius;
  }

  .metric scale trough {
    color: black;
    background-color: $background;
  }

  .metric scale trough highlight {
    background-color: $color3;
    border: 1px solid $background;
    color: #000000;
    border-radius: $radius;
  }

  .metric scale trough {
    border-radius: $radius;
    min-height: 7px;
    min-width: 50px;
  }

  .circular {
    border-radius: $radius;
  }

  .barCircular {
    color: $color9;
    background-color: $foreground;
    border-radius: $radius;
  }

  .iconCircular {
    color: $color9;
    font-size: 10;
    margin: 0px 40px 0 -20px;
  }

  .yellow {
    color: $color2;
  }

  .red {
    color: $color3;
  }

  .orange {
    color: $color3;
  }

  .green {
    color: $color7;
  }

  .text{
    color: $color9;
  }

  // Workspaces

  .workspaces-widget {
    padding: 2px 10px;
  }

  .workspace-entry {
    padding: 0 3px;
    margin: 0;

    transition: color 1s ease-in-out;

    .empty {
      color: $gray;
    }

    .occupied {
      color: $color9;

      font-weight: 700;
    }

    .current {
      color: $background;
      background-color: $color7;
      // padding: 1px;
      border-radius: $radius;

      font-weight: 700;
    }
  }


  // WIDGET
  .canva {
    margin-top: 9px;
    margin-right: 9px;
    background-color: $background;
    padding: 4px;
    border: 2px solid $foreground;
    border-radius: $radius;
    &:hover {
      border: 2px solid $foreground;
      }
  }

  .profileIcon {
    padding: 10px 5px;
    border-radius: 50%;
  }

  .profile {
    padding: 10px;
    border-radius: $radius;

    .user {
      font-weight: 600;
      color: $color2;
    }
  }

  .song_cover_art {
    border-radius: 20px;
  }

  .song_btn_play {
    color: $color3;
    font-size: 28px;
    margin: 3px 0px 0px 5px;

    &:hover {
      color: $color7;
    }
  }

  .song_btn_prev,
  .song_btn_next {
    color: $color3;
    font-size: 24px;
    margin: 3px 0px 0px 5px;

    &:hover {
      color: $color5;
    }
  }

  .section {
    border-radius: $radius + 8;
    // margin: 0 30px;
    margin-left: 5px;
    // padding: 15px 0;
  }

  .songName {
    font-size: 13px;
    font-weight: 700;
  }

  .songArtist {
    font-size: 11px;
  }

  .musicSection {
    padding-top: 28px;
  }

  .titleTodos {
    color: $color9;
    font-weight: 700;
  }

  .taskIndex {
    color: $color4;
  }

  .taskActual {
    color: $color2;
    // font-weight: 600;
  }

  .taskTimeStart {
  }

  .taskSummary {
    font-weight: 600;
  }

  .launcherSection {
    // padding: 40px;
    //padding-right: 22px;
  }

  .launcher {
    // background-color: $gray;
    border-radius: $radius + 8;
    font-size: 40px;

    color: $color3;

    &.apps {
      color: $color9;
    }

    &.gmail {
      color: $color2;
    }

    &:hover {
      color: $color7;
    }

    &.github {
      color: $color7;

      &:hover {
        color: $color8;
      }
    }
  }

  .powertray {
    padding: 0 20px;
    // padding-right: 25px;
    margin: 0 10px;
    font-size: 30px;

    &.poweroff {
      color: $color8;

      &:hover {
        color: $color9;
      }
    }

    &.reboot {
      color: $color2;

      &:hover {
        color: $color4;
      }
    }

    &.sleep {
      color: $color3;

      &:hover {
        color: $color6;
      }
    }
  }

  .buttonStyleWidget {
    border-radius: $radius;
    background: $background;
    // border: 2px solid $color1;
  }

  .todosContainer {
    padding: 20px;
    margin: 20px;
  }

  .launcherProgram {
  }
''
