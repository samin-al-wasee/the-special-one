enum TeamSide { home, away }

extension TeamSideX on TeamSide {
  TeamSide get opponent =>
      this == TeamSide.home ? TeamSide.away : TeamSide.home;
}
