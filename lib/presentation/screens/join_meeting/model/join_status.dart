enum JoinStatus {
  needHostApprove(1),
  canJoin(2),
  banned(3);

  final int status;

  const JoinStatus(this.status);
}
