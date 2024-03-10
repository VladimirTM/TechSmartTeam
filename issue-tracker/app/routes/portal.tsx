import { LoaderFunctionArgs, redirect } from "@remix-run/node";
import { getSessionFromCookie } from "src/server/session-cookie.server";

export const loader = async ({ request }: LoaderFunctionArgs) => {
  const sessionId = await getSessionFromCookie(request);
  if (sessionId) return redirect("/auth");

  throw redirect("/");
};

const Portal = () => {
  return <div>Portal</div>;
};

export default Portal;
