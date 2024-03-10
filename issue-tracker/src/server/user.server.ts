import { database } from "database/connect";

export const getUser = async (sessionId: string) => {
  await database.connect();
  const userQuery = await database.query(
    "SELECT id, username FROM user LEFT JOIN user_session ON user.id = user_session.user_id WHERE user_session.id = $1",
    [sessionId]
  );
  const user = userQuery.rows[0];

  if (!user) return null;

  return user;
};
