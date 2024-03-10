import { createCookie } from "@remix-run/node";

export const getSessionFromCookie = async (request: Request) => {
  const sessionCookie = createCookie("user-session");
  const headerCookie = request.headers.get("Cookie");
  const userSession = await sessionCookie.parse(headerCookie);

  if (!userSession) return null;
  return userSession as string;
};

export const putSessionInCookie = async (sessionId: string) => {
  const sessionCookie = createCookie("user-session", {
    // 1 week in seconds
    maxAge: 604800,
    path: "/",
    sameSite: "lax",
    httpOnly: true,
    secure: true,
  });
  const cookieWithUserSession = await sessionCookie.serialize(sessionId);

  return cookieWithUserSession;
};
