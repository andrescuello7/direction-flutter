const KApiUrl = "https://api-ga6.conveyor.cloud/api/";
const KGoogleApiKey = "AIzaSyBJEMy3MGC8Kuv8yWRwp2FqA1m0gOaRbT4";

//TODO: Revisar cual es el parametro que debe recibir KGoogleApiGeocode
String KGoogleApiGeocode() =>
    "https://maps.googleapis.com/maps/api/geocode/json?address={0}&key=" +
    KGoogleApiKey;

const KWebServiceAuth = KApiUrl + "sysauth";
const KWebServiceAreas = KApiUrl + "areas";
const KWebServiceLocalities = KApiUrl + "localities";
const KWebServiceIvaConditions = KApiUrl + "ivaconditions";
const KWebServiceCustomers = KApiUrl + "customers/profile";

String KWebServiceProductList(int clientType) =>
    KApiUrl + "products/by/customer/type/$clientType";

String KWebServiceProductPicture(int productId) =>
    KApiUrl + "products/picture/$productId";

String KWebServiceOrders(int socketId) => KApiUrl + "orders?socketId=$socketId";

String KWebServiceOrderStatus(int orderId) =>
    KApiUrl + "orders/status/$orderId";
