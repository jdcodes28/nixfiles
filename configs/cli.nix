{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages =
  (with pkgs; [
    sbctl
  ])
  ++
  (with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    claude-code
    codex
    omp
    opencode
  ]);
}
